{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fira-code
    fira-code-symbols
    nerd-fonts.fira-code
    fira-sans
    fira-math
    hack-font
  ];
}
