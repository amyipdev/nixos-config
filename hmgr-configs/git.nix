# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

{
  enable = true;
  userName = "Amy Parker";
  userEmail = "amy@amyip.net";
  signing = {
    key = "7786034BD52149F51B0A2A14B1122F04E962DDC5";
    signByDefault = true;
  };
}
