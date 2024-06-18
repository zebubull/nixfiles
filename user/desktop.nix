{ config, pkgs, ... }:

{
  imports = [
     ./common.nix
     ./hyprland/desktop.nix
     ./kitty/desktop.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    xwaylandvideobridge
    obs-studio
  ];

  programs.fish.interactiveShellInit = ''
      set fish_greeting
      fzf_configure_bindings --variables=\ce
      export ANDROID_SDK_ROOT=/home/zebubull/Android/Sdk
    '';

  home.file.".config/eww/bar/eww.yuck".source = ../res/eww-bar-desktop.yuck;
  home.file.".config/eww/dashboard/eww.scss".source = ../res/eww-dash-2160.scss;
}
