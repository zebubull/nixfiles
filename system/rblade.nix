{ config, pkgs, ... }:

{
  imports =
    [
       ./common.nix
      ../hardware/rblade.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.efi.canTouchEfiVariables = true;
}

