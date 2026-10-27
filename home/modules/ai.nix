{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # code-cursor-fhs
    pi-coding-agent
    aichat
    # claude-code
  ];
}
