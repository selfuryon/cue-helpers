{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devshells.default = {
      name = "cue-helpers";
      packages = [pkgs.cue];
      devshell.startup = {pre-commit.text = config.pre-commit.installationScript;};
    };
  };
}
