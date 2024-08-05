# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

#{ pkgs, ... }:
let
  pkgs = import <nixpkgs> {
    # TODO: deduplicate this with configuration.nix
    config = {
      allowUnfree = true;
      android_sdk.accept_license = true;
    };
  };
in
{
  # Keep categorically separated, and then
  # sort alphabetically from there.
  userPackages = with pkgs; [
    # Toolchains
    autoconf
    automake
    cmake
    degit
    dune_3
    editorconfig-core-c
    gcc
    glslang
    gnumake
    gomodifytags
    gopls
    gore
    gotests
    gotools
    jdk22
    nodejs_22
    php83
    pkg-config
    python312
    rustup
    sbcl

    # Developer/CLI utilities
    contrast
    curlFull
    emacs
    fd
    file
    gdb
    git-crypt
    gnupg
    highlight
    html-tidy
    hyfetch
    jsbeautifier
    magic-wormhole
    nixfmt-rfc-style
    pipenv
    pipx
    qemu_full
    ripgrep
    shellcheck
    stylelint
    tailscale
    terraform
    tree

    # Cybersecurity - General
    checksec
    metasploit
    nmap

    # Cybersecurity - Wireless
    aircrack-ng
    pixiewps
    reaverwps-t6x
    wirelesstools

    # Communications - GUI
    discord
    keybase
    keybase-gui
    signal-desktop
    slack

    # System utilities
    btop

    # Games
    doomretro

    # Backend utilities
    grim # wayland image capture
    hyprland
    hyprpaper
    itools
    neofetch
    slurp
    swaynotificationcenter
    waybar
    wl-clipboard
    wofi

    # General desktop utilities
    inkscape-with-extensions
    kitty
    libreoffice
    nemo
    transmission_4-qt6

    # Libraries
    libnotify
    libtool

    # Packages with conflicts
    #dart
    #flutter319
    #gfortran14
    #ruby
  ] ++ (with pkgs.ocamlPackages; [
    merlin
    ocp-indent
    utop
  ]) ++ (with pkgs.php83Packages; [
    composer
  ]) ++ (with pkgs.python312Packages; [
    isort
    nose
    setuptools
  ]);

  # System packages don't need to be categorized,
  # but should be alphabetically sorted
  systemPackages = with pkgs; [
    android-studio-full
    dig
    hyprland
    inetutils
    killall
    libressl
    nerdfonts
    niv
    python3
    sbctl
    stress-ng
    vim
    wget
  ];
}
