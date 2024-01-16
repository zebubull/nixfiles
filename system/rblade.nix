{ config, pkgs, ... }:

{
  imports =
    [
       ./common.nix
      ../hardware/rblade.nix
    ];
}

