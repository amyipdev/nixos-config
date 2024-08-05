# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

{ config, lib, pkgs, ... }:

let
  packages = import ./packages.nix;
  platform = import ./platform.nix;
in
{
  # Unix user configuration
  users.users.amy = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Amy Parker";
    # TODO: profile picture through AccountsService
    extraGroups = [ "networkmanager" "wheel" "wireshark" ];
  };
  environment.pathsToLink = [ "/share/zsh" ];

  home-manager.users.amy = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    home.packages = packages.userPackages;
    home.stateVersion = platform.stateVersion;

    gtk = import ./hmgr-configs/gtk.nix;

    programs = {
      git = import ./hmgr-configs/git.nix;
      hyfetch = import ./hmgr-configs/hyfetch.nix;
      hyprlock = import ./hmgr-configs/hyprlock.nix;
      kitty = import ./hmgr-configs/kitty.nix;
      waybar = import ./hmgr-configs/waybar.nix;
      zsh = import ./hmgr-configs/zsh.nix;
    };
    services = {
      gpg-agent = import ./hmgr-configs/gpg.nix;
      hypridle = import ./hmgr-configs/hypridle.nix;
      kbfs.enable = true;
      keybase.enable = true;
    };
    wayland.windowManager.hyprland = import ./hmgr-configs/hyprland.nix;
  };
}
