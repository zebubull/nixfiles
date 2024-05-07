{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "zebubull";
  home.homeDirectory = "/home/zebubull";

  imports = [
    ./kitty/kitty.nix
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages =
  let
    flake-init = pkgs.writeScriptBin "mkflake" (builtins.readFile ./fish/mkflake.fish);
  in with pkgs; [
      playerctl
      acpi
      fzf
      fishPlugins.fzf-fish
      fd

      neofetch

      flake-init

      lua-language-server
      zls
      rust-analyzer
      jdt-language-server
      nil
    ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/fish/functions/fish_prompt.fish".source = fish/fish_prompt.fish;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -l";
      la = "ls -la";
      dev = "nix develop --command fish";
      "nix-shell" = "nix-shell --run fish";
    };
  };

  programs.git = {
    enable = true;
    userName = "zebubull";
    userEmail = "ldkourtev@gmail.com";
    aliases = {
      ls = "log --oneline --decorate --all --graph";
    };
  };

  gtk = {
    enable = true;
    cursorTheme.package = pkgs.vimix-cursors;
    cursorTheme.name = "Vimix-cursors";
    cursorTheme.size = 32;
    iconTheme.package = pkgs.vimix-icon-theme;
    iconTheme.name = "Vimix-Amethyst-dark";
    theme.package = pkgs.vimix-gtk-themes;
    theme.name = "vimix-dark-doder";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme= "prefer-dark";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
