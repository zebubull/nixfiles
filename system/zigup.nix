 { stdenv, lib
, fetchurl
, autoPatchelfHook
}:

stdenv.mkDerivation rec {
  pname = "studio-link";
  version = "v2023_07_27";

  src = fetchurl {
    url = "https://github.com/marler8997/zigup/releases/download/${version}/zigup.ubuntu-latest-x86_64.zip";
    hash = "sha256-6d0702ecd2bbe3e2766a563d0f8505a33791eef2d5ab1703267b54405b1c2c26";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    install -m755 -D zigup $out/bin/zigup
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/marler8997/zigup";
    description = "zig version manager";
    platforms = platforms.linux;
  };
}
