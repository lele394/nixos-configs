{ ... }:

{
  environment.etc."wofi/config".text = ''
    style=/etc/wofi/style.css
    width=34%
    height=42%
    location=center
    gtk_dark=true
    hide_scroll=true
    insensitive=true
    matching=fuzzy
    prompt=Search
    allow_images=true
    image_size=32
  '';

  environment.etc."wofi/style.css".text = ''
    * {
      font-family: "FiraCode Nerd Font", "Noto Sans", sans-serif;
      font-size: 14px;
    }

    #window {
      background-color: #0b1220;
      color: #e2e8f0;
      border: 2px solid #d97706;
      border-radius: 10px;
    }

    #outer-box {
        margin: 10px;
    }

    #input {
      background-color: #1e293b;
      color: #e2e8f0;
      border: 2px solid #b45309;
      border-radius: 8px;
      padding: 8px 10px;
      margin-bottom: 10px;
    }

    #scroll {
      margin: 0;
    }

    #entry {
      background-color: transparent;
      color: #94a3b8;
      border-radius: 6px;
      padding: 8px 10px;
      margin: 2px 0;
    }

    #entry:selected {
      background-color: #1e293b;
      color: #d97706;
      border-left: 3px solid #d97706;
    }

    #text {
      color: inherit;
    }
    #img {
      margin-right: 8px;
    }  '';

  environment.etc."xdg/wofi/config".text = ''
    style=/etc/wofi/style.css
    width=34%
    height=42%
    location=center
    gtk_dark=true
    hide_scroll=true
    insensitive=true
    matching=fuzzy
    prompt=Search
    allow_images=true
    image_size=32
  '';

  environment.etc."xdg/wofi/style.css".text = ''
    * {
      font-family: "FiraCode Nerd Font", "Noto Sans", sans-serif;
      font-size: 14px;
    }

    #window {
      background-color: #0b1220;
      color: #e2e8f0;
      border: 2px solid #d97706;
      border-radius: 10px;
    }

    #outer-box {
      margin: 10px;
    }

    #input {
      background-color: #1e293b;
      color: #e2e8f0;
      border: 2px solid #b45309;
      border-radius: 8px;
      padding: 8px 10px;
      margin-bottom: 10px;
    }

    #scroll {
      margin: 0;
    }

    #entry {
      background-color: transparent;
      color: #94a3b8;
      border-radius: 6px;
      padding: 8px 10px;
      margin: 2px 0;
    }

    #entry:selected {
      background-color: #1e293b;
      color: #d97706;
      border-left: 3px solid #d97706;
    }

    #text {
      color: inherit;
    }

    #img {
      margin-right: 8px;
    }
  '';

  environment.etc."xdg/wofi/powermenu" = {
    mode = "0755";
    text = ''
      #!/usr/bin/env bash
      set -euo pipefail

      choice="$(printf '%s\n' "lock" "logout" "reboot" "shutdown" | wofi --conf /etc/wofi/config --style /etc/wofi/style.css --dmenu --prompt "power")"

      [ -z "$choice" ] && exit 0

      case "$choice" in
        lock)
          exec hyprlock
          ;;
        logout)
          exec swaymsg exit
          ;;
        reboot)
          exec systemctl reboot
          ;;
        shutdown)
          exec systemctl poweroff
          ;;
        *)
          exit 1
          ;;
      esac
    '';
  };
}
