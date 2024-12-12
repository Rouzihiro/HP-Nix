{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      #./AMD.nix
      ./nvidia.nix
      ./vulkan.nix
    ];

}

