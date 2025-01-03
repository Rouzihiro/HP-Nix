{
programs.brave = {
  enable = true;
  extensions = let
    dark-reader = "eimadpbcbfnmbkopoojfekhnkhdbieeh";
    privacy-badger = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp";
    vimuim = "dbepggeogbaibhgnhhndojpepiihcmeb";
    duckduckgo-privacy-essentials = "bkdgflcldnnnapblkhphbgpggdiikppg";
    bitwarden = "nngceckbapebfimnlniiiahkandclblb";
    material-icons-for-github = "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc";
    cnl-decryptor = "hfmolcaikbnbminafcmeiejglbeelilh"; # JDownloader "CNL Decryptor"
  in [
    { id = dark-reader; }
    { id = privacy-badger; }
    { id = vimuim; }
    { id = duckduckgo-privacy-essentials; }
    { id = bitwarden; }
    { id = material-icons-for-github; }
    { id = cnl-decryptor; } # Added the CNL Decryptor extension
  ];
};
}
