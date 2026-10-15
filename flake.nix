{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      # url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin ={
      url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    bell = {
      url = "github:lyterk/bell";
    };
    nix-plist-manager = {
      url = "github:sushydev/nix-plist-manager";
    };
    # TODO: Decide if this is worth the change
    # firefox-addons = {
    #   url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      sops-nix,
      stylix,
      nix-darwin,
      bell,
      nix-plist-manager,
      ...
    }@flakeInputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-darwin = import nixpkgs {
        system = "aarch64-darwin";
        config.allowUnfree = true;
      };
    in
    {
      formatter.${system} = pkgs.nixpkgs-fmt;

      nixosConfigurations =
        let
          mkNixosConfiguration =
            name:
            nixpkgs.lib.nixosSystem {
              inherit system;
              specialArgs = {
                inherit flakeInputs pkgs-unstable;
              };
              modules = [
                {
                  networking.hostName = name;
                  nixpkgs.overlays = [ (_: _: { nixfiles = self.packages.${system}; }) ];
                }
                home-manager.nixosModules.home-manager
                sops-nix.nixosModules.sops
                # sops-nix.homeManagerModules.sops
                stylix.nixosModules.stylix
                bell.nixosModules.default
                # stylix.homeManagerModules.stylix
                ./shared
                (./hosts + "/${name}" + /configuration.nix)
                (./hosts + "/${name}" + /hardware.nix)
              ];
            };
        in
        {
          laptop = mkNixosConfiguration "laptop";
          desktop = mkNixosConfiguration "desktop";
          miranda = mkNixosConfiguration "miranda";
        };

    darwinConfigurations =
      let
        darwinSystem = "aarch64-darwin";
        mkDarwinConfiguration =
          name:
          nix-darwin.lib.darwinSystem {
            system = darwinSystem;
            specialArgs = {
              inherit flakeInputs;
              pkgs-unstable = import nixpkgs-unstable {
                system = darwinSystem;
                config.allowUnfree = true;
              };
            };
            modules = [
              home-manager.darwinModules.home-manager
              nix-plist-manager.darwinModules.default
              # sops-nix.homeManagerModules.sops
              (./hosts + "/${name}" + /configuration.nix)
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.lyterk = import (./hosts + "/${name}" + /home.nix);
                home-manager.extraSpecialArgs = { inherit flakeInputs; };
                home-manager.sharedModules = [ nix-plist-manager.homeManagerModules.default ];
              }
            ];
          };
      in
      {
        mac-lyterk = mkDarwinConfiguration "mac-lyterk";
      };


      apps.${system} =
        let
          mkApp = name: script: {
            type = "app";
            program = toString (pkgs.writeShellScript "${name}.sh" script);
          };
        in
        {
          fmt = mkApp "fmt" ''
            PATH=${with pkgs; lib.makeBinPath [ nixfmt-rfc-style ]}

            ${pkgs.lib.fileContents ./scripts/fmt.sh}
          '';

          lint = mkApp "lint" ''
            # TODO: add nix-linter back when the package is no longer broken
            PATH=${with pkgs; lib.makeBinPath [ statix ]}

            ${pkgs.lib.fileContents ./scripts/lint.sh}
          '';
        };
    };
}
