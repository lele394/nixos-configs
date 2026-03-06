{ config, pkgs, ... }:

{
  users.users.leo = {
    isNormalUser = true;
    description = "Laptop User";
    # `wheel` grants sudo access. The rest allow hardware/network control.
    extraGroups =[ "networkmanager" "wheel" "video" "audio" ];
    initialPassword = "leo";
  };
}