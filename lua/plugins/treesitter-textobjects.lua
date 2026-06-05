-- ================================
-- Treesitter Text Objects
-- ================================
-- Seleção e navegação baseada em estrutura de código

return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        local ok, treesitter = pcall(require, "nvim-treesitter.configs")
        if not ok then
            return
        end

        treesitter.setup({
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Vai para o próximo text object automaticamente

                    keymaps = {
                        -- Funções
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",

                        -- Classes
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",

                        -- Condicionais (if/else)
                        ["ai"] = "@conditional.outer",
                        ["ii"] = "@conditional.inner",

                        -- Loops
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",

                        -- Parâmetros/argumentos
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",

                        -- Comentários
                        ["aC"] = "@comment.outer",

                        -- Blocos
                        ["ab"] = "@block.outer",
                        ["ib"] = "@block.inner",
                    },

                    selection_modes = {
                        ["@function.outer"] = "V", -- linewise
                        ["@class.outer"] = "V",    -- linewise
                    },
                },

                move = {
                    enable = true,
                    set_jumps = true, -- Adiciona aos jumplist (Ctrl-o / Ctrl-i)

                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        ["]c"] = "@class.outer",
                        ["]a"] = "@parameter.inner",
                    },

                    goto_next_end = {
                        ["]F"] = "@function.outer",
                        ["]C"] = "@class.outer",
                    },

                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        ["[c"] = "@class.outer",
                        ["[a"] = "@parameter.inner",
                    },

                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                        ["[C"] = "@class.outer",
                    },
                },

                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>sn"] = "@parameter.inner", -- swap com próximo parâmetro
                    },
                    swap_previous = {
                        ["<leader>sp"] = "@parameter.inner", -- swap com parâmetro anterior
                    },
                },
            },
        })
    end,
}
