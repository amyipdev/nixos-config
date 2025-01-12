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
    bison
    bisoncpp
    clang-tools
    cmake
    degit
    dune_3
    editorconfig-core-c
    flex
    gcc
    glslang
    gnumake
    gomodifytags
    gopls
    gore
    gotests
    gotools
    jdk23
    melonDS
    mono5
    ninja
    nodejs_22
    php83
    pkg-config
    python313
    rustup
    sbcl
    texliveFull
    wineWow64Packages.waylandFull
    xml2rfc

    # Developer/CLI utilities
    bear
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
    htop
    hyfetch
    jsbeautifier
    magic-wormhole
    nixfmt-rfc-style
    pipenv
    pipx
    pwalarmd
    pwalarmctl
    qemu_full
    ripgrep
    shellcheck
    stylelint
    subversion
    tailscale
    terraform
    tmux
    tree
    unzip
    zip

    # Cybersecurity - General
    checksec
    metasploit
    nmap
    openvpn

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
    openconnect
    networkmanager-openconnect
    networkmanagerapplet
    sysbench

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
    zlib

    # General desktop utilities
    inkscape-with-extensions
    kitty
    libreoffice
    nemo
    nextcloud-client
    obs-studio
    rpi-imager
    transmission_4-qt6

    # Libraries
    glib
    libnotify
    libtool
    imagemagick
    xmlstarlet

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
  ]) ++ (with pkgs.python313Packages; [
    setuptools
  ]) ++ (with pkgs.obs-studio-plugins; [
    wlrobs
    obs-vaapi
    obs-webkitgtk
    obs-vkcapture
    obs-gstreamer
    obs-multi-rtmp
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
    niv
    python3
    rose-pine-cursor
    sbctl
    sshfs
    stress-ng
    vim
    wget
  ];
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    dina-font
    corefonts
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
