echo "{"
echo "  inputs ="
echo "  {"
echo "    nixpkgs.url = \"github:nixos/nixpkgs/nixos-24.05\";"
echo "  };"
echo "  outputs =  { self, nixpkgs, ... }:"
echo "  let"
echo "    system = \"x86_64-linux\";"
echo "    pkgs = nixpkgs.legacyPackages.\${system};"
echo "  in"
echo "  {"
echo "    devShells.x86_64-linux.default = pkgs.mkShell"
echo "    {"
echo "      nativeBuildInputs = with pkgs; ["
echo "      ];"
echo "    };"
echo "  };"
echo "}"
