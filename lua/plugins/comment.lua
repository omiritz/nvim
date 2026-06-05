-- ================================
-- Comment.nvim - Comentários
-- ================================

return {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("Comment").setup({
            -- Adiciona espaço entre comentário e texto
            padding = true,

            -- Mantém cursor na posição ao comentar
            sticky = true,

            -- Ignora linhas vazias
            ignore = "^$",

            -- Keymaps
            toggler = {
                line = "gcc",  -- Comentar linha: gcc
                block = "gbc", -- Comentar bloco: gbc
            },

            opleader = {
                line = "gc",   -- Comentar com movimento: gc{motion}
                block = "gb",  -- Comentar bloco: gb{motion}
            },

            extra = {
                above = "gcO", -- Adiciona comentário acima
                below = "gco", -- Adiciona comentário abaixo
                eol = "gcA",   -- Adiciona comentário no final da linha
            },

            mappings = {
                basic = true,
                extra = true,
            },
        })
    end,
}
