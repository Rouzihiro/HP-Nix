{ pkgs, ... }:

let
  finecmdline = pkgs.vimUtils.buildVimPlugin {
    name = "fine-cmdline";
    src = pkgs.fetchgit {
      url = "https://github.com/rhysd/fine-cmdline.vim";
      rev = "master"; # Fetch the latest commit from the master branch
    };
  };
  # Define yazi here, just like you did for finecmdline
  yazi = pkgs.vimPlugins.yazi-nvim;
  whichKey = pkgs.vimPlugins.which-key-nvim;
in {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
      extraPackages = with pkgs; [
        lua-language-server
        gopls
        xclip
        wl-clipboard
        luajitPackages.lua-lsp
        nil
        rust-analyzer
        yaml-language-server
        pyright
        marksman
      ];
      plugins = with pkgs.vimPlugins; [
        alpha-nvim
        auto-session
        bufferline-nvim
        dressing-nvim
        indent-blankline-nvim
        nui-nvim
        finecmdline
        yazi # Now correctly included
        whichKey
        nvim-treesitter.withAllGrammars
        lualine-nvim
        nvim-autopairs
        nvim-web-devicons
        nvim-cmp
        nvim-surround
        nvim-lspconfig
        cmp-nvim-lsp
        cmp-buffer
        luasnip
        cmp_luasnip
        friendly-snippets
        lspkind-nvim
        comment-nvim
        nvim-ts-context-commentstring
        plenary-nvim
        neodev-nvim
        telescope-nvim
        todo-comments-nvim
        nvim-tree-lua
        telescope-fzf-native-nvim
        vim-tmux-navigator
        vimtex
      ];
      extraConfig = ''
        set noemoji
        nnoremap : <cmd>FineCmdline<CR>  
      '';
      extraLuaConfig = ''
        ${builtins.readFile ./nvim/options.lua}
        ${builtins.readFile ./nvim/keymaps.lua}
        ${builtins.readFile ./nvim/plugins/alpha.lua}
        ${builtins.readFile ./nvim/plugins/autopairs.lua}
        ${builtins.readFile ./nvim/plugins/auto-session.lua}
        ${builtins.readFile ./nvim/plugins/comment.lua}
        ${builtins.readFile ./nvim/plugins/cmp.lua}
        ${builtins.readFile ./nvim/plugins/lsp.lua}
        ${builtins.readFile ./nvim/plugins/nvim-tree.lua}
        ${builtins.readFile ./nvim/plugins/telescope.lua}
        ${builtins.readFile ./nvim/plugins/todo-comments.lua}
        ${builtins.readFile ./nvim/plugins/treesitter.lua}
        ${builtins.readFile ./nvim/plugins/fine-cmdline.lua}
        require("ibl").setup()
        require("bufferline").setup{}
        require("lualine").setup({
          icons_enabled = true,
        })
        require("which-key").setup {}
      '';
    };
  };
}
