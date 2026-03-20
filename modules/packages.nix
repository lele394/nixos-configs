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
    wofi          # Wayland launcher
    hyprlock      # Wayland screen locker
    
    # --- Wayland Essentials ---
    wl-clipboard  # Enables copy/pasting in Wayland
    waybar        # Status bar for Sway/Wayland
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
    bat
    
    # --- Basic System Utilities ---
    git           # Essential for tracking your NixOS config changes
    wget
    jq
    btop          # System resource monitor
    fzf

    # --- Video player, PDF viewer, and image viewer ---
    vlc           # Video player
    zathura       # PDF viewer
    sxiv          # Simple X Image Viewer

    # --- Compilers and Runtimes ---
    # nodejs        # JavaScript runtime
    # rustc         # Rust compiler
    # cargo         # Rust package manager
    # python3       # Python 3 interpreter
    # python3Packages.pip # Python package manager
    # fortran        # Fortran compiler
    # gcc             # C/C++ compiler
    # nvc             # NVIDIA Fortran Compiler


    # --- Development Tools ---
    code           # Visual Studio Code

    # --- nice to have ---
    # ...
  ];
}