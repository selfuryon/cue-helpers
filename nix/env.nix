{
  perSystem = {
    devshells.default = {
      name = "cue-helpers";
      env = [
        {
          name = "CUE_EXPERIMENT";
          eval = "evalv3";
        }
      ];
    };
  };
}
