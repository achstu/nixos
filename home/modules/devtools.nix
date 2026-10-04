{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # bash/general
    ripgrep
    tmux
    
    # cpp
    # clang
    # clang-tools
    # cmake
    # gcc
    # gnumake pkg-config
    # gdb
    # lldb # debuggers
    # nasm
    # bear
    # llvmPackages.clang-tools
    # libs
    # libcxx
    # gmp
    # boost
    # libclang
    # valgrind

    # rust
    cargo
    rustc
    rustfmt
    rust-analyzer
    cargo-modules

    # zig dev
    zig
    zls

    # python dev
    python3
    pypy3
    ruff
    uv
    virtualenv

    # json support
    jq
    vscode-langservers-extracted
    yq
  ];
}
