# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

let
  platform = import ../platform.nix;
in
{
  enable = true;
  plugins = [ ];
  settings = {
    env = [
        "XCURSOR_THEME,Adwaita"
        "XCURSOR_SIZE,24"
    ];
    general = {
      gaps_in = 15;
      gaps_out = 50;
      border_size = 2;
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";
      layout = "dwindle";
      resize_on_border = false;
    };
    decoration = {
      rounding = 10;
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      shadow = {
        render_power = 3;
        color = "rgba(1a1a1aee)";
        range = 4;
        enabled = true;
      };
      #drop_shadow = true;
      #shadow_range = 4;
      #shadow_render_power = 3;
      #"col.shadow" = "rgba(1a1a1aee)";
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        vibrancy = 0.1696;
      };
    };
    animations = {
      enabled = true;
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };
    master = {
      new_status = "master";
    };
    misc = {
      force_default_wallpaper = -1;
      disable_hyprland_logo = false;
    };
    input = {
      kb_layout = "us";
      follow_mouse = 1;
      sensitivity = 0;
      touchpad = {
        natural_scroll = false;
      };
    };
    gestures = {
      workspace_swipe = false;
    };
    exec = [
      (builtins.toString ../scripts/restart-waybar.sh)
    ];
    exec-once = [
      "swaync"
    ];
    # TODO: add media control binds
    bind = [
      ", Print, exec, ${../scripts/screenshot.sh}"
      "$mod, Q, exec, $terminal"
      "$mod, C, killactive,"
      "$mod, M, exit,"
      "$mod, E, exec, $fileManager"
      "$mod, V, togglefloating,"
      "$mod, R, exec, $menu"
      "$mod, P, pseudo,"
      "$mod, J, togglesplit,"
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"
      "$mod, SPACE, exec, ${../scripts/language-cycle.sh}"
    ];
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
    windowrulev2 = [
      "suppressevent maximize, class:.*"
    ];
    "$terminal" = "kitty";
    "$fileManager" = "nemo";
    "$menu" = "wofi --show drun";
    "$mod" = "SUPER";
    monitor = platform.monitors;
  };
  systemd = {
    enable = true;
    enableXdgAutostart = true;
    variables = [  ];
  };
  xwayland.enable = true;
}
