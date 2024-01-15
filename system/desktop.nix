{ config, pkgs, ... }:

{
  imports =
    [
       ./common.nix
      ../hardware/desktop.nix
    ];
}

