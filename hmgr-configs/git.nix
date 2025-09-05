# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

{
  enable = true;
  userName = "Amy Parker";
  userEmail = "amy@amyip.net";
  signing = {
    key = "49C853C284C8B26F921F18DFEE9B60638AD5B41B";
    signByDefault = true;
  };
}
