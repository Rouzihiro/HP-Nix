{ config, pkgs, ... }:

let
  # Define the path to the Samba credentials file
  sambaCredsPath = "/home/rey/.ssh/samba/creds";
in
{
  # Mount the Samba share at /mnt/fritz
  fileSystems."/mnt/fritz" = {
    device = "//192.168.178.1/FRITZ.NAS"; # SMB server and share path
    fsType = "cifs";
    options = [
      "credentials=${sambaCredsPath}"  # Use the credentials file
      "rw"                             # Read and write access
      "uid=1000"                       # Map files to user ID 1000
      "gid=100"                        # Map files to group ID 100
      "file_mode=0644"                 # Default file permissions
      "dir_mode=0755"                  # Default directory permissions
    ];
  };

  # Ensure the credentials file exists with proper permissions
  systemd.tmpfiles.rules = [
    "d /home/rey/.ssh 0700 rey users -"
    "d /home/rey/.ssh/samba 0700 rey users -"
    "f ${sambaCredsPath} 0600 rey users -"
  ];

  # Optional: Set an environment variable for Samba credentials
  environment.variables = {
    SAMBA_CREDS = "${sambaCredsPath}";
  };
}

