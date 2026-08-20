{
  lib,
  stdenv,
  fetchFromGitHub,
  openssl,
  cmake,
  zlib,
  useTLS ? true,
}:
stdenv.mkDerivation {
  name = "IXWebSocket";
  version = "12.0.1";
  src = fetchFromGitHub {
    owner = "machinezone";
    repo = "IXWebSocket";
    rev = "v12.0.1";
    hash = "sha256-2QWIpLVIs2vGuMEhewDyihYdDQBz7SsOtfZ6pE67j2Q=";
  };

  cmakeFlags = [
    "-DBUILD_SHARED_LIBS=ON"
  ] ++ lib.optional useTLS "-DUSE_TLS=1";

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    zlib
  ] ++ lib.optional useTLS openssl;

  meta = {
    homepage = "https://github.com/machinezone/IXWebSocket";
    description = "A C++ library for WebSocket client and server development";
    longDescription = ''
      IXWebSocket is a C++ library for WebSocket client and server development. It has minimal dependencies (no boost), is very simple to use and support everything you'll likely need for websocket dev (SSL, deflate compression, compiles on most platforms, etc...).
    '';
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ mysaa ];
  };
}
