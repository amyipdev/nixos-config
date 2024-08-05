{ config, lib, pkgs, ... }:

let
  platform = import ./platform.nix;
in
{
  # hostname configuration
  networking.hostName = platform.hostName;

  # NetworkManager chaos
  networking.networkmanager = {
    enable = true;
  };

  #networking.firewall = {};
}
