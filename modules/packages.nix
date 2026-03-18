{ config, pkgs, ... }:

{
  imports = [
    ./configs/kitty.nix
  ];

  environment.systemPackages = with pkgs;[
    # --- Requested Software ---
    nano
    neovim
    firefox
    kitty

    # --- Wayland Core Tools ---
    foot          # Wayland terminal
    wmenu         # Wayland launcher
    hyprlock      # Wayland screen locker
    
    # --- Wayland Essentials ---
    wl-clipboard  # Enables copy/pasting in Wayland
    i3status      # Status generator for swaybar
    swaybg        # Utility to set desktop wallpapers

    # --- Wayland Screenshot/Recording Tools ---
    zenity        # GTK dialog chooser (Screenshot/Record)
    grim          # Screenshot tool for Wayland
    slurp         # Region selector for Wayland
    wf-recorder   # Screen recorder for Wayland
    
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
    fzf

    # --- Video player, PDF viewer, and image viewer ---
    vlc           # Video player
    zathura       # PDF viewer
    sxiv          # Simple X Image Viewer
  ];
}