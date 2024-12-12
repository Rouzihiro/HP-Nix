return {
  {
    "lervag/vimtex",
    ft = "tex", -- Load only for .tex files
    config = function()
      -- Set the PDF viewer to Zathura
      vim.g.vimtex_view_method = "zathura"

      -- Use latexmk as the compiler
      vim.g.vimtex_compiler_method = "latexmk"

      -- Output compiled files to a 'build' directory
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "build",
      }

      -- Disable conceal by default for better readability
      vim.g.vimtex_syntax_conceal = {
        accents = 0,
        cites = 0,
        fancy = 0,
        greek = 0,
        math_bounds = 0,
        math_delimiters = 0,
        math_fracs = 0,
        math_super_sub = 0,
        math_symbols = 0,
        sections = 0,
        styles = 0,
      }

      -- Custom keybindings for LaTeX commands
      vim.api.nvim_set_keymap(
        "n",
        "<leader>lc",
        ":VimtexCompile<CR>",
        { noremap = true, silent = true, desc = "Compile LaTeX" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>lv",
        ":VimtexView<CR>",
        { noremap = true, silent = true, desc = "View PDF" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>lt",
        ":VimtexClean<CR>",
        { noremap = true, silent = true, desc = "Clean LaTeX build files" }
      )

      -- Enable quickfix integration for easier error navigation
      vim.g.vimtex_quickfix_mode = 1
    end,
  },
}

