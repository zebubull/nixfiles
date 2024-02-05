{ config, pkgs, ... }:

{
  imports = [
     ./common.nix
     ./hyprland/rblade.nix
     ./waybar/rblade.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
  ];

  programs.fish.interactiveShellInit = ''
      set fish_greeting
      fzf_configure_bindings --variables=\ce
    '';
}
