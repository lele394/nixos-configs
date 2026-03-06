{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs;[
    # --- Requested Software ---
    nano
    neovim
    firefox
    kitty

    # --- DWL Failsafes ---
    foot          # DWL default terminal (Super+Enter)
    wmenu        # DWL default launcher (Super+P)
    
    # --- Wayland Essentials ---
    wl-clipboard  # Enables copy/pasting in Wayland
    waybar        # Lightweight status bar
    swaybg        # Utility to set desktop wallpapers
    
    # --- Laptop Hardware Controls ---
    brightnessctl # Command-line screen brightness control
    pavucontrol   # GUI application for managing audio volume
    playerctl     # Allows media keys (Play/Pause) to work
    networkmanagerapplet # GUI tray icon for selecting Wi-Fi networks
    
    # --- File Modifying / Extraction ---
    xarchiver     # Backend needed for Thunar to extract/create archives
    unzip
    zip
    
    # --- Basic System Utilities ---
    git           # Essential for tracking your NixOS config changes
    wget
    btop          # System resource monitor
  ];
}