{ ... }:

{
  # Sway (Wayland Window Manager)
  programs.sway = {
    enable = true;
  };

  # Keybind and floaty
  environment.etc."sway/config.d/90-screenshot.conf".text = ''
    for_window [title="ScreenCap"] floating enable
    bindsym $mod+Shift+s exec bash /etc/nixos/misc/script/bash/screenCap.sh
  '';


  environment.etc."sway/config.d/90-kitty.conf".text = ''
    bindsym Ctrl+Alt+t exec kitty
  '';

  environment.etc."i3status.conf".text = ''
    general {
      colors = true
      interval = 2
    }

    order += "cpu_usage"
    order += "cpu_temperature 0"
    order += "tztime local"

    cpu_usage {
      format = "CPU %usage"
    }

    cpu_temperature 0 {
      format = "%degrees°C"
      path = "/sys/class/thermal/thermal_zone0/temp"
    }

    tztime local {
      format = "%Y-%m-%d %H:%M"
    }
  '';
}
