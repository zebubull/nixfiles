{ config, pkgs, ... }:

{
  #
  # Bootloader.
  #

  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;

  #
  # Hardware
  #

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  #
  # Networking
  #

  networking.networkmanager.enable = true;

  #
  # Sound
  #

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  #
  # Services
  #

  services.dbus.enable = true;

  services.printing = {
      enable = true;
      drivers = with pkgs; [ gutenprint ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.mpd = {
    enable = true;
    musicDirectory = "/home/zebubull/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
      '';

    # Optional:
    startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
    user = "zebubull";
  };

  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000";
  };

  security.pam.services.swaylock = {};

  #
  # Desktop
  #

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  fonts.packages = with pkgs; [
    font-awesome
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    noto-fonts-cjk-sans
  ];

  #
  # Locale
  #

  time.timeZone = "America/Detroit";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  #
  # Users
  #

  environment.shells = with pkgs; [ fish ];
  # Enable dark mode (maybe) (probably not)
  environment.etc = {
    "xdg/gtk-2.0/gtkrc".text = "gtk-application-prefer-dark-theme=1";
    "xdg/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-application-prefer-dark-theme=1'';
    "xdg/gtk-4.0/settings.ini".text = ''
    [Settings]
    gtk-application-prefer-dark-theme=1'';
  };

  users.users.zebubull = {
    isNormalUser = true;
    description = "Luka Kourtev";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox-wayland
    ];
  };

  users.users.zebubull.shell = pkgs.fish;
  programs.fish.enable = true;

  #
  # Input
  #

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };

  #
  # Packages
  #

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # editor
    neovim
    kitty

    # sound
    pulseaudio
    pulsemixer

    # DE stuff
    dbus
    gtk4
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    wayland
    xdg-desktop-portal-hyprland
    brightnessctl
    swaylock-effects
    swayidle
    swww
    eww

    # app launcher
    rofi-wayland

    # notifications
    mako

    # clipboard support
    cliphist
    wl-clipboard

    # other utilities
    bat
    wget
    libsecret
    ripgrep
    musescore
    muse-sounds-manager
    gimp
    qimgv
    grim
    slurp
    ffmpeg
    discord
  ];

  #
  # Programs
  #

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    config = {
        credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
    };
  };

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.localBinInPath = true;
}
