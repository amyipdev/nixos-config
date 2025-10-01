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

  networking.extraHosts = ''
    # HTB
    10.10.11.25 greenhorn.htb
    127.0.0.251 ocverify.amyip.net
  '';
}
