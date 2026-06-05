-- ================================
-- Treesitter Context
-- ================================
-- Mostra função/classe atual no topo da tela

return {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("treesitter-context").setup({
            enable = true,
            max_lines = 3, -- Quantas linhas de contexto mostrar
            min_window_height = 0,
            line_numbers = true,
            multiline_threshold = 1,
            trim_scope = "outer",
            mode = "cursor", -- 'cursor' ou 'topline'
            separator = nil,
            zindex = 20,
        })

        -- Keymap para pular para o contexto
        vim.keymap.set("n", "[x", function()
            require("treesitter-context").go_to_context()
        end, { desc = "Pular para contexto" })
    end,
}
