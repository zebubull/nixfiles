{ config, pkgs, ... }:

{
  imports = [
     ./common.nix
     ./hyprland/rblade.nix
     ./waybar/rblade.nix
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
}
