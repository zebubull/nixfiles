patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $argv
