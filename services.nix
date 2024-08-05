# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    # TODO: get to a good custom themed DM, like LightDM or something
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    # TODO: find out what packages are depended on from GNOME
    # (utilities, fonts, libraries, etc) and install those directly.
    # including all of GNOME is bloat
    desktopManager.gnome.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  services.dbus.enable = true;
  services.gvfs.enable = true;
  services.openssh.enable = true;
  services.pcscd.enable = true;
  # TODO: get printing actually working
  # if it works on Fedora, it should work here...
  services.printing.enable = true;
  services.tailscale.enable = true;

  systemd.services.NetworkManager-wait-online.enable = false;
}
