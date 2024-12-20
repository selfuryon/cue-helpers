{inputs, ...}: {
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem = {config, ...}: {
    treefmt = {
      projectRootFile = ".git/config";
      programs = {
        cue.enable = true;
      };
      settings.global.excludes = ["cue.mod/*" "flake.lock"];
    };
    formatter = config.treefmt.build.wrapper;
  };
}
