{ config, pkgs, ... }:

{
  imports =
    [
       ./common.nix
      ../hardware/rblade.nix
    ];
    
  # Bootloader stuff
  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
}

