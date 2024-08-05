# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

let
  platform = import ../platform.nix;
in
{
  enable = true;
  settings = {
    ipc = "on";
    splash = false;
    preload = platform.wallpaper.preload;
    wallpaper = platform.wallpaper.wallpaper;
  };
}
