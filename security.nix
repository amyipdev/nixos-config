# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

{ config, lib, pkgs, ... }:

{
  # PAM modules
  security.pam = {
    # Hyprlock PAM settings, TODO make this actually work
    services.hyprlock = {};
  };

  security.rtkit.enable = true;
}
