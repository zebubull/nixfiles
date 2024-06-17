{ config, pkgs, ... }:

{
  # load non-computer-specific settings
  imports = [
    ./kitty.nix
  ];

  programs.kitty.settings.font.size = 12;
}
