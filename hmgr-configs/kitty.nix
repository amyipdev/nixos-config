# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

{
  font = {
    package = null;
    name = "CaskaydiaCove Nerd Font";
    size = 10;
  };
  extraConfig = ''
    window_padding_width 12
  '';
  shellIntegration.enableZshIntegration = true;
  theme = "Everforest Dark Hard";
  enable = true;
}
