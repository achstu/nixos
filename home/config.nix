{ pkgs, ... }:

{
  # helix
  home.file.".config/helix/config.toml".source = ./dotfiles/helix/config.toml;
  home.file.".config/helix/languages.toml".source = ./dotfiles/helix/languages.toml;

  # kitty
  home.file.".config/kitty/kitty.conf".source = ./dotfiles/kitty/kitty.conf;

  # typstfmt
  home.file.".config/typstfmt/typstfmt.toml".source = ./dotfiles/typstfmt/typstfmt.toml;

  # zathura
  home.file.".config/zathura/zathurarc".source = ./dotfiles/zathura/zathurarc;

  
  home.file.".gitconfig".source = ./dotfiles/git/gitconfig;
}
