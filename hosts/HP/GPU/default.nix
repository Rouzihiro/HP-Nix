{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./intel.nix
      #./amd.nix
      #./nvidia.nix
      #./vulkan.nix
    ];

}

