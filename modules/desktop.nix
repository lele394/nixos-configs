{ config, pkgs, ... }:

{
  # Ly Display Manager
  services.displayManager.ly.enable = true;

  # DWL (Wayland Window Manager)
  programs.dwl.enable = true;

  # Thunar File Manager (Requires extra services to behave normally)
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce;[
    thunar-archive-plugin
    thunar-volman
  ];
  programs.xfconf.enable = true;  # Required to save Thunar preferences
  services.gvfs.enable = true;    # Adds Mount, Trash, and Network drive support
  services.tumbler.enable = true; # Adds thumbnail support for images

  # Fonts
  fonts.packages = with pkgs;[
    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.fira-code # Monospace font for Kitty/Coding
  ];
}