# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

{
  enable = true;
  settings = {
    preset = "lesbian";
    mode = "rgb";
    light_dark = "dark";
    lightness = 0.59;
    color_align = {
      mode = "custom";
      custom_colors = {
        "2" = 0;
        "1" = 3;
      };
      fore_back = [];
    };
    backend = "neofetch";
    pride_month_disable = false;
  };
}
