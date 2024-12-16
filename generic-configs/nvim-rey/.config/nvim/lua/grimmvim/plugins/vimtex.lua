return {
    -- Vimtex plugin
    "lervag/vimtex",
    config = function()
        -- vimtex configuration goes here
        vim.g.vimtex_view_method = 'zathura'  -- PDF viewer
        vim.g.vimtex_compiler_method = 'latexmk'  -- LaTeX compiler
    end
}

