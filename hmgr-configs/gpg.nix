# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

let
  pkgs = import <nixpkgs> {  };
in
{
  enable = true;
  defaultCacheTtl = 1800;
  enableSshSupport = true;
  pinentryPackage = pkgs.pinentry-gtk2;
}
