{ buildPythonPackage, numpy, tensorflow }:

buildPythonPackage rec {
  name = "${pname}-${version}";
  pname = "mpnn";
  version = "0.0.1";
  src = ./.;

  propagatedBuildInputs = [ numpy tensorflow ];
  checkPhase = ''
    python3 mpnn_test.py
    python3 set2vec_test.py
  '';
}
