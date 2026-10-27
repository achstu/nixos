{
  description = "just random string";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Staging ground for future inputs:
    # nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    # sops-nix.url        = "github:Mic92/sops-nix";
    # nur.url             = "github:nix-community/NUR";
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      username = "achstu";

      # Helper: builds a NixOS configuration for a given host dir
      mkHost =
        hostDir:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            # ── host-specific ────────────────────────
            (import "${hostDir}/hardware-configuration.nix")
            (import "${hostDir}/default.nix")

            # ── shared system modules ────────────────
            ./system/audio.nix
            ./system/printing.nix
            ./system/gnome.nix

            # ── home-manager as a NixOS module ───────
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true; # reuse system nixpkgs
                useUserPackages = true; # allow home-manager to use system packages
                extraSpecialArgs = { inherit username; };

                users.${username} = import ./home/achstu.nix;
              };
            }
          ];
        };
    in
    {
      # ── machines ────────────────────────────────
      nixosConfigurations = {
        latitude7480 = mkHost ./hosts/latitude7480;
        # framework13 = mkHost ./hosts/framework13;   # ← future
      };

      # ── convenience ──────────────────────────────
      # `nix run .#mvd -- <dest>`  — move newest download
      # packages.x86_64-linux.mvd = (import ./scripts/mvd.nix) { };
    };
}
