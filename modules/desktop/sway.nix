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

    # Logout
    unbindsym $mod+Shift+l #is used for vim like motions I believe?
    bindsym $mod+Shift+l exec bash swaymsg exit
  '';


  environment.etc."sway/config.d/90-kitty.conf".text = ''
    bindsym Ctrl+Alt+t exec kitty
  '';

  environment.etc."sway/config.d/90-launcher.conf".text = ''
    unbindsym $mod+d
    bindsym $mod+d exec wofi --conf /etc/wofi/config --style /etc/wofi/style.css --allow-images --show drun
  '';

  environment.etc."sway/config.d/90-wofi-menus.conf".text = ''

    # Add wofi power menu
    unbindsym $mod+l
    bindsym $mod+l exec bash /etc/xdg/wofi/powermenu
  '';

  environment.etc."sway/config.d/91-wallpaper.conf".text = ''
    output * bg /etc/nixos/misc/background.jpg fill
  '';

  # Video output
  # environment.etc."sway/config.d/91-output.conf".text = ''
  #   output Virtual-1 resolution 1920x1200
  # '';

  environment.etc."sway/config.d/92-theme.conf".text = ''
    # 5-base palette + derived shades
    set $base_main    #d97706
    set $base_bg      #0b1220
    set $base_surface #1e293b
    set $base_text    #e2e8f0
    set $base_danger  #ef4444

    set $main         $base_main
    set $main_dim     #b45309
    set $main_light   #f59e0b

    set $bg           $base_bg
    set $bg_dim       #0f172a
    set $bg_light     $base_surface

    set $text         $base_text
    set $text_dim     #94a3b8
    set $text_muted   #64748b

    set $danger       $base_danger
    set $danger_dim   #b91c1c
    set $danger_bg    #7f1d1d

    default_border pixel 3
    default_floating_border pixel 3
    gaps inner 0
    gaps outer 0

    # Focused and active windows
    # client.<class> <border> <background> <text> <indicator> <child_border>
    # client.<state> BORDER BG TEXT ACCENT ACCENT_BG ### QUICK REF
    client.focused          $bg_light  $bg_light  $text      $bg_light  $bg_light
    client.focused_inactive $bg_light  $bg_dim    $text_dim  $bg_light  $bg_dim
    client.unfocused        $bg_light  $bg        $text_dim  $bg_light  $bg
    client.urgent           $danger    $danger_bg $text      $danger    $danger_bg
    client.placeholder      $bg_light  $bg        $text_muted $bg_light $bg
  '';

  environment.etc."sway/config.d/94-bar-config.conf".text = ''
    # Hide swaybar, use Waybar instead
    bar {
      mode invisible
    }
  '';

  environment.etc."sway/config.d/95-waybar.conf".text = ''
    exec_always --no-startup-id swaymsg 'bar mode invisible'
    exec_always --no-startup-id pkill -x waybar || true
    exec_always --no-startup-id waybar -c /etc/xdg/waybar/config -s /etc/xdg/waybar/style.css
  '';

  environment.etc."sway/config.d/93-workspaces.conf".text = ''
    # Keep number shortcuts, show kanji in bar labels
    exec_always --no-startup-id swaymsg "rename workspace number 1 to 1:一"
    exec_always --no-startup-id swaymsg "rename workspace number 2 to 2:二"
    exec_always --no-startup-id swaymsg "rename workspace number 3 to 3:三"
    exec_always --no-startup-id swaymsg "rename workspace number 4 to 4:四"
    exec_always --no-startup-id swaymsg "rename workspace number 5 to 5:五"
    exec_always --no-startup-id swaymsg "rename workspace number 6 to 6:六"
    exec_always --no-startup-id swaymsg "rename workspace number 7 to 7:七"
    exec_always --no-startup-id swaymsg "rename workspace number 8 to 8:八"
    exec_always --no-startup-id swaymsg "rename workspace number 9 to 9:九"
    exec_always --no-startup-id swaymsg "rename workspace number 10 to 10:十"
  '';

  environment.etc."xdg/waybar/config".text = ''
    {
      "layer": "top",
      "position": "top",
      "modules-left": ["clock"],
      "modules-center": ["sway/workspaces"],
      "modules-right": ["cpu", "temperature", "memory", "network"],

      "sway/workspaces": {
        "disable-scroll": true,
        "format": "{icon}",
        "format-icons": {
          "1": "一",
          "2": "二",
          "3": "三",
          "4": "四",
          "5": "五",
          "6": "六",
          "7": "七",
          "8": "八",
          "9": "九",
          "10": "十",
          "1:一": "一",
          "2:二": "二",
          "3:三": "三",
          "4:四": "四",
          "5:五": "五",
          "6:六": "六",
          "7:七": "七",
          "8:八": "八",
          "9:九": "九",
          "10:十": "十",
          "urgent": "⚠"
        }
      },

      "clock": {
        "format": "{:%A %d %B %Y -- %Hh%M}",
        "tooltip": false
      },

      "cpu": {
        "format": " {usage}%"
      },

      "temperature": {
        "thermal-zone": 0,
        "critical-threshold": 80,
        "format": " {temperatureC}°C /"
      },

      "memory": {
        "format": "󰍛 {percentage}%"
      },

      "network": {
        "format-wifi": " {essid} ({signalStrength}%)",
        "format-ethernet": " {ipaddr}",
        "format-linked": " {ipaddr}",
        "format-disconnected": " down",
        "tooltip": false
      }
    }
  '';

  environment.etc."xdg/waybar/style.css".text = ''
    @define-color main #d97706;
    @define-color main_dim #b45309;
    @define-color bg #0b1220;
    @define-color bg_dim #0f172a;
    @define-color bg_light #1e293b;
    @define-color text #e2e8f0;
    @define-color text_dim #94a3b8;
    @define-color danger #ef4444;

    * {
      border: none;
      border-radius: 0;
      font-family: "FiraCode Nerd Font", "Noto Sans", sans-serif;
      font-size: 13px;
      min-height: 0;
    }

    window#waybar {
      background: @bg;
      color: @text;
    }

    #workspaces {
      margin-left: 6px;
    }

    #workspaces button {
      color: @text_dim;
      background: transparent;
      padding: 0 8px;
      border-bottom: 2px solid transparent;
    }

    #workspaces button.focused,
    #workspaces button.active {
      color: @main;
      background: transparent;
      border-bottom: 2px solid @main;
    }

    #workspaces button.focused label,
    #workspaces button.active label {
      color: @main;
    }

    #workspaces button.urgent {
      color: @text;
      background: @danger;
    }

    #clock {
      color: @text;
      padding: 0 10px;
      margin: 4px 0;
    }

    #cpu,
    #temperature,
    #memory,
    #network {
      color: @text;
      padding: 0 8px;
      margin: 0 2px;
      background: @bg_dim;
    }

    #temperature.critical {
      background: @danger;
      color: @text;
    }
  '';

  # Hyprlock (Wayland Screen Locker)
  environment.etc."hypr/hyprlock.conf".text = ''
    background {
      monitor =
      path = /etc/nixos/misc/background.jpg
      color = rgba(0b1220ff)
    }

    label {
      monitor =
      text = cmd[update:10000] echo "$USER"
      color = rgba(e2e8f0ff)
      font_size = 28
      position = 0, 80
      halign = center
      valign = center
    }

    input-field {
      monitor =
      size = 280, 52
      outline_thickness = 2
      outer_color = rgba(d97706ff)
      inner_color = rgba(1e293bff)
      font_color = rgba(e2e8f0ff)
      fail_color = rgba(ef4444ff)
      placeholder_text = Password...
      hide_input = false
      position = 0, -20
      halign = center
      valign = center
    }
  '';
}
