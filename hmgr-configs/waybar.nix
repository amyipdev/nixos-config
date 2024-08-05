# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

{
  enable = true;
  settings = {
    mainBar = {
      margin-left = 45;
      margin-right = 45;
      margin-top = 15;
      margin-bottom = 5;
      spacing = 24;
      layer = "top";
      position = "top";
      height = 30;
      output = [
        "HDMI-A-1"
      ];
      cpu = {
        interval = 1;
        format = "{usage}% ";
        max-length = 10;
      };
      memory = {
        interval = 1;
        format = "{}% ";
        max-length = 10;
      };
      load = {
        interval = 1;
        format = "{} avg";
        max-length = 10;
      };
      "custom/clock" = {
        format = "{}";
        exec = "/home/amy/scripts/clock.sh";
        on-click = "/home/amy/scripts/toggleClock.sh";
      };
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "hyprland/window" ];
      modules-right = [ "hyprland/language" "wireplumber" "cpu" "load" "memory" "custom/clock" ];
    };
  };
  style = ''
    * {
      font-family: Caskaydia Cove Nerd Font Mono, sans-serif;
      font-size: 17px;
    }
    window#waybar {
      background-color: rgba(43, 43, 43, 0.65);
      border-radius: 15px;
      color: #ffffff;
      transition-property: background-color;
      transition-duration: 0.5s;
    }
    .modules-right {
      padding-right: 15px;
    }
    .modules-left {
      padding-left: 15px;
    }
  '';
}
