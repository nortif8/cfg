{ ... }:
{
  imports = [ ./users.nix ];

  programs.nix-ld.enable = true;
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;
}
