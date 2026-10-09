{ pkgs, ... }:

{

  imports = [
    ../../shared/firefox
  ];

  home.username = "lyterk";
  home.homeDirectory = "/Users/lyterk";
  home.stateVersion = "26.05";

  stylix = {
    enable = true;
    # Stylix requires an image even on darwin; reuse the same wallpaper
    image = pkgs.fetchurl {
      url = "https://getwallpapers.com/wallpaper/full/a/b/1/126669.jpg";
      hash = "sha256-vxGCjrK1nYsMAQSfeJCb37j4/snuoK367gNw/GemAiw=";
    };
    targets.firefox.profileNames = [ "kevinDefault" ];
  };

  sops = {
    age.keyFile = "/Users/lyterk/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets/default-secret.yaml;
    secrets = {
      homeSshPrivateKey = {
        owner = "lyterk";
        mode = "0600";
        path = "/Users/lyterk/.ssh/id_ed25519";
        sopsFile = ../../secrets/sshKeys.yaml;
      };
      gpgCode = {
        path = "/Users/lyterk/.gnupg/code-gpg-key";
        owner = "lyterk";
        mode = "0600";
      };
      gpgKev = {
        path = "/Users/lyterk/.gnupg/kev-gpg-key";
        owner = "lyterk";
        mode = "0600";
      };
    };
  };


  programs = {
    home-manager.enable = true;

    browserpass = {
      enable = true;
      browsers = [ "firefox" ];
    };

    fish = {
      enable = true;
      interactiveShellInit = ''
        atuin init fish | source
      '';
    };

    git = {
      enable = true;
      settings = {
        user.name = "Kevin Lyter";
        user.email = "code@lyterk.com";
        commit.gpgsign = true;
        init = {
          templateDir = "~/dotfiles/common/git_templates/";
          defaultBranch = "mainline";
        };
        pull.rebase = true;
        credential.helper = "cache";
        core.excludesFile = "~/dotfiles/common/gitignore";
      };
      signing.key = "0F39E83B";
    };

    ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings = {
        "git" = {
          hostname = "txru.me";
          port = 65222;
          user = "git";
          identityFile = "~/.ssh/id_ed25519";
        };
        "github.com" = {
          hostname = "github.com";
          user = "git";
          identityFile = "~/.ssh/id_ed25519";
        };
        "bitbucket.org" = {
          hostname = "bitbucket.org";
          user = "git";
          identityFile = "~/.ssh/id_ed25519";
        };
        "desktop" = {
          hostname = "txru.me";
          port = 65222;
          user = "lyterk";
          identityFile = "~/.ssh/id_ed25519";
        };
        "remarkable" = {
          hostname = "10.11.99.1";
          user = "root";
          identityFile = "~/.ssh/id_ed25519";
        };
      };
    };

    gpg = {
      enable = true;
    };
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 3600;
    maxCacheTtl = 86400;
    # pinentry-mac is installed via homebrew in configuration.nix
    pinentry.package = pkgs.pinentry_mac;
  };
}
