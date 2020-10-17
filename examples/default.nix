{ nixpkgsSrc ? builtins.fetchTarball
  "https://github.com/NixOS/nixpkgs/archive/84d74ae9c9cbed73274b8e4e00be14688ffc93fe.tar.gz"
, pkgs ? import nixpkgsSrc { }, compiler ? "ghc884", hoogle ? true }:

let
  src = ./.;

  compiler' = if compiler != null then
    compiler
  else
    "ghc" + pkgs.lib.concatStrings
    (pkgs.lib.splitVersion pkgs.haskellPackages.ghc.version);

  # Any overrides we require to the specified haskell package set
  haskellPackages = with pkgs.haskell.lib;
    pkgs.haskell.packages.${compiler'}.override {
      overrides = self: super:
        {
          th-desugar = self.th-desugar_1_11;
          pretty-simple = self.pretty-simple_4_0_0_0;
          prettyprinter = self.prettyprinter_1_7_0;
          autoapply = markUnbroken (dontCheck super.autoapply);
          vulkan = let
            srcFilter = path: type:
              (baseNameOf path == "package.yaml")
              || pkgs.lib.hasInfix "/src" path;
          in doHaddock (disableLibraryProfiling (self.callCabal2nix "vulkan"
            (builtins.filterSource srcFilter ../.) {
              vulkan = pkgs.vulkan-loader;
            }));
          vulkan-utils = addExtraLibrary (doHaddock
            (disableLibraryProfiling (self.callCabal2nix "" ../utils { })))
            pkgs.vulkan-headers;
          VulkanMemoryAllocator = addExtraLibrary (doHaddock
            (disableLibraryProfiling
              (self.callCabal2nix "" ../VulkanMemoryAllocator { })))
            pkgs.vulkan-headers;
        } // pkgs.lib.optionalAttrs hoogle {
          ghc = super.ghc // { withPackages = super.ghc.withHoogle; };
          ghcWithPackages = self.ghc.withPackages;
        };
    };

  # Any packages to appear in the environment provisioned by nix-shell
  extraEnvPackages = with pkgs; [ vulkan-validation-layers ];

  # Generate a haskell derivation using the cabal2nix tool on `package.yaml`
  drv = let
    fixes = drv:
      with pkgs.haskell.lib;
      addExtraLibrary (addBuildTool drv pkgs.glslang) pkgs.renderdoc;
    old = fixes
      (haskellPackages.callCabal2nixWithOptions "" src "--flag=renderdoc" { });
  in old // {
    # Insert the extra environment packages into the environment generated by
    # cabal2nix
    env = pkgs.lib.overrideDerivation old.env (attrs:
      {
        buildInputs = attrs.buildInputs ++ extraEnvPackages;
      } // pkgs.lib.optionalAttrs hoogle {
        shellHook = attrs.shellHook + ''
          export HIE_HOOGLE_DATABASE="$(cat $(${pkgs.which}/bin/which hoogle) | sed -n -e 's|.*--database \(.*\.hoo\).*|\1|p')"
        '';
      });
  };

in if pkgs.lib.inNixShell then drv.env else drv
