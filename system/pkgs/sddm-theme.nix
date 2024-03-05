{ pkgs }:
let
  imgLink = "https://raw.githubusercontent.com/zebubull/nixfiles/main/res/img/wallpaper.png";

  image = pkgs.fetchurl {
    url = imgLink;
    hash = "sha256-JxNSFeOII6TXTAoCM0xoC+k5PqZ4A8RzEX1WR9AXjT4=";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Background.jpg
    cp -r ${image} $out/Background.jpg
   '';
}

