{
  description = "Just random string";

  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Add other inputs as needed
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      agenix,
      ...
    }:
    {
      nixosConfigurations = {

        # server (in the future, after migration to x1)
        # Dell Latitude 7480
        latitude7480 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/latitude7480
            home-manager.nixosModules.home-manager
            agenix.nixosModules.default
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.achstu = import ./home/achstu.nix;
            }
          ];
        };

        # ThinkPad X1 Carbon Gen 8, i7
        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/x1carbon
            home-manager.nixosModules.home-manager
            agenix.nixosModules.default
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.achstu = import ./home/achstu.nix;
            }
          ];
        };
      };
    };
}
