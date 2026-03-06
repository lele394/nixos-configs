{ config, pkgs, ... }:

{
  # EFI bootloader, not for VMs
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;


  # VM bootloader configuration (Legacy BIOS)
  # Use GRUB for Legacy BIOS instead
  boot.loader.grub.enable = true;
  
  # Set this to your VM's main drive. 
  # It is usually "/dev/vda" (for KVM/QEMU) or "/dev/sda" (for VirtualBox/VMware).
  # You can run `lsblk` in the terminal to check the name of your disk.
  boot.loader.grub.device = "/dev/vda";

  # Networking (Essential for a laptop)
  networking.hostName = "nixos-laptop";
  networking.networkmanager.enable = true; 

  # Timezone and Locale
  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";

  # Audio (Pipewire is the modern standard for Linux audio)
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Laptop Power Management
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;


  # Configure console keymap (for the TTY / raw terminal)
  # Raw TTY
  console.keyMap = "fr";
  # idk if it really works
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };
  # DWL fallback
  environment.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "fr";
  };
}