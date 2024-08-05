# SPDX-License-Identifier: MIT
# amyipdev's nixos config
# (c) 2024 Amy Parker (amyipdev)

# TODO: flush out aliases a bit more
# TODO: patch p10k for emacs vterm
let
  pkgs = import <nixpkgs> {};
in
{
  enable = true;
  enableCompletion = true;
  enableVteIntegration = true;
  antidote = {
    enable = true;
    plugins = [ "romkatv/powerlevel10k" ];
  };
  autocd = true;
  autosuggestion.enable = true;
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "sudo" ];
  };
  prezto = {
    enable = true;
    color = true;
    editor.dotExpansion = true;
    syntaxHighlighting.highlighters = [ "main" "brackets" "pattern" "line" "cursor" "root" ];
    terminal.autoTitle = true;
  };
  shellAliases = {
    ll = "ls -lh";
    la = "ls -a";
    lla = "ls -lah";
    lal = "ls -lah";
    ".." = "cd ..";
    nix-build-local = "nix-build -E 'let pkgs = import <nixpkgs> { }; in pkgs.callPackage ./default.nix {}'";
    reload = "source ~/.zshrc";
    rust-arm-cross = "nix-shell --run \"RUSTFLAGS=\\\"-C linker=aarch64-unknown-linux-musl-gcc -C target-feature=+crt-static\\\" cargo build --release --target aarch64-unknown-linux-musl\"";
    ssh-sappho = "ssh root@amyip.net -p 65111";
    ssh-maria = "ssh -fNL 3306:10.2.0.3:3306 root@amyip.net -p 65111";
    ssh-sappho-portal = "ssh -fNL 8006:10.1.0.1:8006 root@amyip.net -p 65111";
  };
  initExtra = ''
    [[ ! -f ${../dots/p10k.zsh} ]] | source ${../dots/p10k.zsh}
  '';
  envExtra = ''
    export PATH="$PATH:/home/amy/.config/emacs/bin"
    export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:${pkgs.libressl.dev}/lib/pkgconfig:${pkgs.python313}/lib/pkgconfig"
  '';
}
