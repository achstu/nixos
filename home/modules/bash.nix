{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      bash
      fzf
    ];

    sessionVariables = {
      TIMEFORMAT = "%Rs";
    };
  };

  programs = {
    bash = {
      enableCompletion = true; # TODO default -> remove
      shellAliases = {
        grep = "grep --color=auto";
        llm = "aichat -e";
      };
      profileExtra = ''
        PS1="\[\e[1m\]\[\e[32m\][\$?] \s \W ->\[\e[0m\] "
      '';
      initExtra = ''

        shopt -s histappend
        shopt -s dotglob

        PROMPT_COMMAND="''${PROMPT_COMMAND:+''${PROMPT_COMMAND};}history -a"
        HISTSIZE=100000
        HISTFILESIZE=100000

        if command -v fzf-share >/dev/null; then
          source "$(fzf-share)/key-bindings.bash"
          source "$(fzf-share)/completion.bash"
        fi
      '';
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
