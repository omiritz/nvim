-- ================================
-- Telescope - Fuzzy Finder
-- ================================

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "%.git/",
                    "node_modules/",
                    "target/",
                    "__pycache__/",
                    "%.pyc",
                    "%.class",
                    "%.jar",
                    "%.war",
                    "%.ear",
                    "build/",
                    "dist/",
                    "%.egg-info/",
                },

                layout_config = {
                    width = 0.9,
                    height = 0.9,
                    preview_width = 0.6,
                },

                preview = {
                    treesitter = false,
                },

                mappings = {
                    i = {
                        ["<C-d>"] = actions.delete_buffer,
                    },
                    n = {
                        ["dd"] = actions.delete_buffer,
                    },
                },
            },

            pickers = {
                find_files = {
                    hidden = false,
                    no_ignore = false,
                },
            },
        })

        -- Keymaps customizados sem preview para melhor performance
        vim.keymap.set("n", "<leader>ff", function()
            builtin.find_files({ previewer = false })
        end, { desc = "Buscar arquivos (sem preview)" })

        vim.keymap.set("n", "<leader>fb", function()
            builtin.buffers({ previewer = false })
        end, { desc = "Buscar buffers (sem preview)" })
    end,
}
