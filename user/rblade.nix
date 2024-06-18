{ config, pkgs, ... }:

{
  imports = [
     ./common.nix
     ./hyprland/rblade.nix
     ./kitty/rblade.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages =
  let
    offload = pkgs.writeScriptBin "offload" (builtins.readFile ./fish/offload.fish);
  in [
    offload
  ];

  programs.fish.interactiveShellInit = ''
      set fish_greeting
      fzf_configure_bindings --variables=\ce
    '';

  home.file.".config/eww/bar/eww.yuck".source = ../res/eww-bar-rblade.yuck;
  home.file.".config/eww/dashboard/eww.scss".source = ../res/eww-dash-1080.scss;
}
