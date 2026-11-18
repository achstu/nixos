{
  config,
  pkgs,
  username,
  ...
}:
{
  # The home.stateVersion option does not have a default and must be set
  home.stateVersion = "26.05";
  # Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ];

  imports = [
    ./modules/bash.nix
    # ./modules/starship.nix
    ./modules/fonts.nix
    # ./modules/timers.nix # TODO better backup approach
    ./modules/sway.nix
    ./modules/apps.nix
    ./modules/devtools.nix

    ./config.nix
  ];

  programs.firefox.enable = true;

  home.packages = with pkgs; [
    (import ./scripts/mvd.nix { inherit pkgs; })
    vscode-fhs
    kitty
    ripgrep
    opencode    
  ];

}
