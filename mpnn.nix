{ buildPythonPackage, numpy, tensorflow }:

buildPythonPackage rec {
  name = "${pname}-${version}";
  pname = "mpnn";
  version = "0.0.1";
  src = ./.;

  propagatedBuildInputs = [ numpy tensorflow ];
}
