let
  overlay = self: super: {
    # Expects kwohlfahrt overlay, see nixpkgs#44426
    pythonOverrides = super.lib.composeExtensions super.pythonOverrides (pyself: pysuper: {
      mpnn = pysuper.callPackage ./mpnn.nix {};
    });

    python36 = super.python36.override {
      packageOverrides = self.pythonOverrides;
    };
  };

  pkgs = import <nixpkgs> {
    config = {
      cudaSupport = true;
      allowUnfreePredicate = pkg: builtins.elem (builtins.parseDrvName pkg.name).name [
        "cudatoolkit" "nvidia-x11"
      ];
    };
    overlays = (import ~/.config/nixpkgs/overlays.nix) ++ [overlay];
  };
in pkgs.python36.pkgs.mpnn
