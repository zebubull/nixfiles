{ config, pkgs, ... }:

{
  # load non-computer-specific settings
  imports = [
    ./kitty.nix
  ];

  programs.kitty.font = {
    name = "JetBrains Mono";
    size = 16;
  };
}
