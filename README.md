# NixOS Minimal Config

The following is a minimal working NixOS config. This is meant as a very barebone config for a working system, and is meant to be built upon.

By barebone I mean something you can connect to the internet, browse, edit files, check system and running processes, access git.

This is targetting laptops with `brightnessctl`.

Please note that the default config (this one) targets legacy BIOS, not EFI. This can be changed in [system.nix](./modules/system.nix).

This is mainly for personal use, please make sure it fits your needs and hardware.

---

It comes with the following : 

 Some base stuff
- nano
- neovim
- firefox
- kitty

 DWL Failsafes
- foot : DWL default terminal
- wmenu : DWL default launcher
- 
 Wayland Essentials 
- wl-clipboard
- waybar
- swaybg
 
 Laptop Hardware Controls
- brightnessctl 
- pavucontrol   
- playerctl     
- networkmanagerapplet
- 
 File Modifying / Extraction 
- xarchiver
- unzip
- zip
- 
 Basic System Utilities
- git           
- wget
- btop          

---

Note the default user is `leo` and initial password is `leo`. Please run `passwd` on first login.
You can change the username in [user.nix](./modules/user.nix)