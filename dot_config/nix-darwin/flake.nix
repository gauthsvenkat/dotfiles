{
  description = "Personal mac configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nix-darwin,
      home-manager,
      ...
    }:
    let
      username = "gauthsvenkat";
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Gauthams-MacBook-Air
      darwinConfigurations."Gauthams-MacBook-Air" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./configuration.nix
          home-manager.darwinModules.home-manager
          {
            users.users.${username}.home = "/Users/${username}/";
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = import ./home.nix;
            };
          }
        ];
      };
    };
}
