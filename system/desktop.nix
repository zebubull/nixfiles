{ config, pkgs, ... }:

{
  imports =
    [
       ./common.nix
      ../hardware/desktop.nix
    ];

  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;

  networking.hostName = "goblin-city";
  programs.corectrl.enable = true;
}

