{
  lib,
  stdenv,
  fetchFromGitHub,
  pkg-config,
  ixwebsocket,
  openssl,
  pkgs,
  cmake,
  jsoncpp,
  zlib,
}:
stdenv.mkDerivation {
  name = "APCpp";
  version = "2026-08-14";
  src = fetchFromGitHub {
    owner = "N00byKing";
    repo = "APCpp";
    rev = "49c47f0688b9438763fa4764a13714c89dedbadc";
    hash = "sha256-xgQ0+M6Jig7GQHmnxoURVUE6R4SwEagYQxj7KYvITvw=";
  };

  patches = [
    ./use-system-ixwebsocket.patch
  ];

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    ixwebsocket
    zlib
    jsoncpp
    openssl
  ];

  meta = {
    homepage = "https://github.com/N00byKing/APCpp";
    description = "C++ Library for Clients interfacing with the Archipelago Multi-Game Randomizer";
    license = lib.licenses.lgpl21Only;
    maintainers = with lib.maintainers; [ mysaa ];
  };
}
