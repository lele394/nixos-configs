{ config, pkgs, ... }:

{
  imports =[
      ./hardware-configuration.nix
      ./modules/system.nix
      ./modules/desktop.nix
      ./modules/packages.nix
      ./modules/user.nix
    ];

  # Leave this on the version your system was originally installed with
  system.stateVersion = "24.05"; 
}