# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

{ config, lib, pkgs, ... }:

{
  # Force Pulse off
  hardware.pulseaudio.enable = false;

  # PipeWire configuration
  services.pipewire = {
    enable = true;
    # pipewire-alsa, for masochist devs
    alsa = {
      enable = true;
      support32Bit = true;
    };
    # pipewire-pulse, for compatibility
    pulse.enable = true;
  };
}
