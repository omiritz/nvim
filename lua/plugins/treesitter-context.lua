return {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("treesitter-context").setup({
            enable = true,
            max_lines = 3,
            min_window_height = 20,
            line_numbers = true,
            multiline_threshold = 20,
            trim_scope = "outer",
            mode = "cursor",
        })

        -- Keymaps
        vim.keymap.set("n", "[c", function()
            require("treesitter-context").go_to_context()
        end, { desc = "Ir para contexto" })
    end,
}
