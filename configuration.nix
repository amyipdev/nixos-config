# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

# TODO: fully automated install, including Lanzaboote

{ config, lib, pkgs, ... }:

let
  emacs-overlay = import (builtins.fetchTarball https://github.com/nix-community/emacs-overlay/archive/master.tar.gz);
  lanzaboote = import (builtins.fetchTarball https://github.com/nix-community/lanzaboote/archive/master.tar.gz);
  packages = import ./packages.nix;
  platform = import ./platform.nix;
in
{
  imports =
    [
      ./boot.nix
      ./hardware-configuration.nix
      ./home.nix
      ./i18n.nix
      ./networking.nix
      ./security.nix
      ./services.nix
      ./sound.nix

      # TODO: figure out how to directly import home-manager
      # TODO: automatic defintions of Nix channels
      <home-manager/nixos>

      lanzaboote.nixosModules.lanzaboote
    ];

  # State version for the system - depends on when installed
  system.stateVersion = platform.stateVersion;

  # nixpkgs configuration
  nixpkgs.config = {
    allowUnfree = true;
    android_sdk.accept_license = true;
  };
  nixpkgs.overlays = [
    emacs-overlay
  ];

  # system packages
  environment.systemPackages = packages.systemPackages;

  # nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Mandatory enables; safe to ignore
  programs.firefox.enable = true;
  programs.hyprland = {
    #enable = true;
    #xwayland.enable = true;
  };
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
  programs.zsh.enable = true;

  # Assorted graphical settings
  qt.platformTheme = "gtk2";
}
