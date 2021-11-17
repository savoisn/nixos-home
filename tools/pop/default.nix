{ stdenv, dpkg, glibc, gcc-unwrapped, autoPatchelfHook }:
let

  # Please keep the version x.y.0.z and do not update to x.y.76.z because the
  # source of the latter disappears much faster.
  version = "8.0.6";

  src = ./pop_8.0.6_amd64.deb;

in stdenv.mkDerivation {
  name = "pop${version}";

  system = "x86_64-linux";

  inherit src;

  # Required for compilation
  nativeBuildInputs = [
    autoPatchelfHook # Automatically setup the loader, and do the magic
    dpkg
  ];

  # Required at running time
  buildInputs = [
    glibc
    gcc-unwrapped
  ];

  unpackPhase = "true";

  # Extract and copy executable in $out/bin
  installPhase = ''
    mkdir -p $out
    dpkg -x $src $out
    cp -av $out/opt/Pop/usr/bin/* $out
  '';

  meta = {
    description = "Pop";
    homepage = https://pop.com/;
    license = "";
    maintainers = [ ];
    platforms = [ "x86_64-linux" ];
  };
}

