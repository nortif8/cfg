{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      loadSys = sysName: {
        system = "x86_64-linux";
        modules = [
          ./sys/${sysName}/config.nix
          {
            virtualisation.vmVariant.virtualisation.cores = 4
            ;
            virtualisation.vmVariant.virtualisation.memorySize = 8192
            ;
          }
        ];
      };
    in
    {
      nixosConfigurations.orcus = nixpkgs.lib.nixosSystem (loadSys "orcus");
    };
}
