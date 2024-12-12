#!/bin/sh

# 1. Delete unused generations
echo "Deleting unused generations..."
sudo nix-collect-garbage -d

# 2. Clean up dependencies
echo "Cleaning up unused dependencies..."
sudo nix-collect-garbage

# 3. Optimize the Nix store
echo "Optimizing the Nix store..."
sudo nix-store --optimise

# 4. List installed packages in user profile (for information)
echo "Listing installed packages in user profile:"
nix-env -q

# 5. Clean cache directory
echo "Cleaning cache directory..."
sudo nix-store --gc

# 6. Remove temporary files
echo "Removing temporary files..."
sudo rm -rf /tmp/*

# 7. Clean old data and logs
echo "Cleaning log files..."
sudo journalctl --vacuum-time=2weeks

echo "Cleanup completed."
