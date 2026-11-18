{ ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
      command_timeout = 500;
      scan_timeout = 10;

      format = "$directory$git_branch$git_status$character";

      directory = {
        truncation_length = 3;
        truncation_symbol = "…/";
        style = "bold cyan";
      };

      git_branch = {
        symbol = " ";
        style = "bold purple";
      };

      git_status.style = "bold red";

      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[>](bold red)";
      };
    };
  };
}
