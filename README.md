# dotfiles

![Made with trial and error](https://img.shields.io/badge/Made%20with-trial%20and%20error-blue?style=flat-square&logo=haskell)
[![NixOS Unstable](https://img.shields.io/badge/NixOS-unstable-blue.svg?style=flat-square&logo=NixOS&logoColor=white)](https://nixos.org)

Currently transitioning to a new setup, the old dotfiles can be found in the [`old` Hyprland](https://github.com/Rouzihiro/HP-Nix/tree/Hyprland).

NixOS dotfiles 
 - greetd offers Tripple-Launch option (Hyprland / Sway / Wayfire)

Further the dotfiles include:
- ZSH setup

## Usage
The dotfiles contain configuration for:
- [HP](./hosts/HP) - Personal NixOS HP laptop (see system information)
- [Gaming](./hosts/Gaming) - Personal laptop (optimized for gaming)
- [Mac](./hosts/mac) - Work Macbook M1
- home-manager configurations for all systems

Refer to the respective host directories for more information.

## To-Do
- [ ] Modularize the setup
- [ ] Optimize Sway
- [ ] Optimize Wayfire
- [ ] Docker support
- [ ] Dev environments
- [x] Full Neovim setup
- [ ] Full nix-darwin setup with system configuration
- [ ] Server setup
  - [ ] Explore [disko](https://github.com/nix-community/disko) for declarative disk management
  - [ ] Explore [nixos-anywhere](https://github.com/nix-community/nixos-anywhere) for remote installation

## Host-HP

<!-- System Information -->
# System Info
- **OS**: NixOS 25.05.20241227.634fd46 (Warbler) x86_64
- **Kernel**: Linux 6.6.67
- **Packages**: 3194 (nix-system)
- **Display**: 1920x1080 @ 60 Hz in 24" [External]
- **WM**: Hyprland (Wayland)
- **Terminal**: kitty 0.38.0
- **User**: rey@HP

<!-- Hardware Info -->
## Hardware
- **CPU**: Intel(R) Core(TM) i5-8350U
- **GPU**: UHD Graphics 620
- **GPU Driver**: i915
- **Memory**: X GiB / 7.61 GiB (X%)

## Useful resources
- [NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world/)
- [Nix language basics](https://nix.dev/tutorials/nix-language)
- [Encypted Btrfs Root with Opt-in State on NixOS](https://mt-caret.github.io/blog/posts/2020-06-29-optin-state.html)
- [Quick Start: NixOS Secure Boot](https://github.com/nix-community/lanzaboote)
- [Nixpkgs Functions reference](https://nixos.org/manual/nixpkgs/stable/#chap-functions)
- [Nix Expression Language](https://nixos.org/manual/nix/stable/#ch-expression-language)
- [hlissner/dotfiles](https://github.com/hlissner/dotfiles)
