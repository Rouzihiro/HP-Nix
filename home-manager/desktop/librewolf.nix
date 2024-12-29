{
  programs.librewolf = {
    enable = true;
    # Enable WebGL, cookies, and history settings
    settings = {
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "network.cookie.lifetimePolicy" = 0;
    };

    # Extra configuration to copy the CSS file
    extraConfig = ''
      # Create the chrome directory and place userChrome.css
      mkdir -p "${config.xdg.configHome}/librewolf/chrome"
      cat > "${config.xdg.configHome}/librewolf/chrome/userChrome.css" << EOF
      /* =========================================================================================================
        Styling
      ==========================================================================================================*/

      #navigator-toolbox {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
      }

      #TabsToolbar {
        order: 1;
        position: relative;
        margin-left: -21.8vw !important;
      }

      #nav-bar {
        order: 2;
        flex: 0 0 30%;
        border: transparent !important;
        background: transparent !important;
      }

      #PersonalToolbar {
        order: 3;
        width: 100%;
      }

      #urlbar-container {
        width: auto !important;
      }

      #urlbar {
        background: transparent !important;
        border: none !important;
        box-shadow: none !important;
      }

      /* =========================================================================================================
        Remove items
      ==========================================================================================================*/

      .titlebar-buttonbox,
      .titlebar-spacer,
      #forward-button,
      #back-button,
      #tracking-protection-icon-container,
      #page-action-buttons,
      #PanelUI-button,
      #identity-box,
      #tracking-protection-icon-container,
      #page-action-buttons> :not(#urlbar-zoom-button, #star-button-box),
      #urlbar-go-button,
      #alltabs-button,
      .titlebar-buttonbox-container {
        display: none !important;
      }
      EOF
    '';
  };
}

