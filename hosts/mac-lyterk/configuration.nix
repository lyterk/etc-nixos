{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # System-wide settings
  environment.systemPackages = with pkgs; [
    alacritty
    cargo
    direnv
    fd
    fish
    cmake
    gcc
    git
    git
    gnupg
    neovim
    nil
    (pass.withExtensions (ext: [ ext.pass-otp ]))
    ripgrep
    rust-analyzer
    wget
    zstd
  ];

  environment.variables.HOMEBREW_NO_ANALYTICS = "1";

  users.users.lyterk = {
    name = "lyterk";
    home = "/Users/lyterk"; # Explicitly set the absolute path here
    shell = pkgs.fish;
  };


  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    brews = [
      "coreutils"
      "trash"
      "pinentry-mac"
      "hax"
      "fzf"
    ];

    # GUI apps managed via Homebrew casks. Note: onActivation.upgrade = true
    # means these are upgraded on every darwin-rebuild (casks that self-update,
    # like firefox, are skipped unless `greedy` is set).
    casks = [
      "emacs-mac" # Emacs fork with better macOS support
      "firefox"
    ];

    taps = [
      "railwaycat/emacsmacport" # emacs-mac
      # "oleksandrchekhovskyi/hax"
      {
        name = "oleksandrchekhovskyi/hax";
        trusted = true;
      }
    ];

    masApps = {
      Tailscale = 1475387142; # App Store URL id
    };
  };

  # Set your preferred shell
  programs.fish.enable = true;

  # Set your hostname (change as needed)
  networking.hostName = "mac-lyterk";

  # Enable TouchID for sudo (optional, on supported hardware)
  security.pam.services.sudo_local.touchIdAuth = true;

  # System-wide macOS settings managed by nix-plist-manager (exported via
  # `nix run github:sushydev/nix-plist-manager#current -- mac-system.nix --scope system`).
  programs.nix-plist-manager = {
    enable = true;
    options = import ./systemConfig/mac-system.nix;
  };

  # Basic system preferences
  system.defaults.dock.autohide = true;
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
  system.stateVersion = 6;
  system.primaryUser = "lyterk";

  # Allow unfree packages (e.g., Google Chrome)
  nixpkgs.config.allowUnfree = true;
}
