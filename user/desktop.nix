{ config, pkgs, ... }:

{
  imports = [
     ./common.nix
     ./hyprland/desktop.nix
     ./waybar/desktop.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    discord
    xwaylandvideobridge
    obs-studio
  ];

  programs.fish.interactiveShellInit = ''
      set fish_greeting
      fzf_configure_bindings --variables=\ce
    '';
}
