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

  environment.etc."sway/config.d/90-lock.conf".text = ''
    unbindsym $mod+l
    bindsym $mod+l exec hyprlock
  '';

  environment.etc."sway/config.d/91-wallpaper.conf".text = ''
    output * bg /etc/nixos/misc/background.jpg fill
  '';

  environment.etc."sway/config.d/94-bar-config.conf".text = ''
    bar bar-0 {
      position top
      status_command i3status -c /etc/i3status.conf
    }
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

  # Hyprlock (Wayland Screen Locker)
  environment.etc."hypr/hyprlock.conf".text = ''
    background {
      monitor =
      path = /etc/nixos/misc/background.jpg
      color = rgba(1e1e2eff)
    }

    label {
      monitor =
      text = cmd[update:10000] echo "$USER"
      color = rgba(cdd6f4ff)
      font_size = 28
      position = 0, 80
      halign = center
      valign = center
    }

    input-field {
      monitor =
      size = 280, 52
      outline_thickness = 2
      outer_color = rgba(b4befeff)
      inner_color = rgba(11111bff)
      font_color = rgba(cdd6f4ff)
      fail_color = rgba(f38ba8ff)
      placeholder_text = Password...
      hide_input = false
      position = 0, -20
      halign = center
      valign = center
    }
  '';
}
