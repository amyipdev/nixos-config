# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

let
  pkgs = import <nixpkgs> {};
in
{
  enable = true;
  theme = {
    package = pkgs.omni-gtk-theme;
    name = "Omni";
  };
}
