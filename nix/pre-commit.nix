{inputs, ...}: {
  imports = [
    inputs.pre-commit-hooks-nix.flakeModule
  ];

  perSystem = {
    pre-commit.settings = {
      excludes = ["cue.mod/" "flake.lock"];
      hooks = {
        statix.enable = true;
        deadnix.enable = true;
      };
    };
  };
}
