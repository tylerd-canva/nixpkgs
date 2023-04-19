{ lib
, stdenv
, file
, fetchFromGitLab
, buildPerlPackage
}:

buildPerlPackage rec {
  pname = "debhelper";
  version = "13.11.4";

  outputs = [ "out" "dev" ]; # no "devdoc"

  src = fetchFromGitLab {
    domain = "salsa.debian.org";
    owner = "debian";
    repo = pname;
    rev = "debian/${version}";
    sha256 = "1yff6x847nksciail9jly41mv70sl8sadh0m5d847ypbjmxcwjpq";
  };

  postBuild = ''
    patchShebangs ./bin
  '';

  meta = with lib; {
    homepage = "https://salsa.debian.org/debian/debhelper";
    description = "Debhelper is used to help you build a Debian package.";
    license = licenses.gpl2;
    maintainers = with maintainers; [ tylerd-canva ];
    platforms = with platforms; linux;
  };
}
