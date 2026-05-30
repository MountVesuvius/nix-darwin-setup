{ config, pkgs, ... }:

{
  services.ollama = {
    enable = true;

    # Optional: You can specify additional environment variables here if needed
    environmentVariables = {
      # Example: OLLAMA_NUM_PARALLEL = "2";
    };
  };
}
