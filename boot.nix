# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

{ config, lib, pkgs, ... }:

{
  # systemd-boot configuration
  # TODO: figure out way to automate Secure Boot installation
  boot.loader.systemd-boot = {
    enable = lib.mkForce false;
    memtest86.enable = true;
  };

  # efi configuration
  boot.loader.efi = {
    efiSysMountPoint = "/boot";
    canTouchEfiVariables = true;
  };

  # kernel configuration
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "quiet" "splash" ];

  # TODO: fix clairo plymouth resolution
  # plymouth configuration
  boot.plymouth = {
    enable = true;
    # TODO: get plymouth theming working (and looking good)
  };

  # initrd - systemd early-loading for plymouth
  boot.initrd = {
    systemd = {
      enable = true;
      emergencyAccess = true;
      enableTpm2 = true;
    };
  };

  # Lanzaboote - uefi secure boot setup
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
}
