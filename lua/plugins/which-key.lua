-- ================================
-- Which-Key - Mostra atalhos disponíveis
-- ================================

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")

        wk.setup({
            preset = "modern",
            delay = 500, -- Delay em ms antes de mostrar o popup

            -- Aparência
            icons = {
                breadcrumb = "»",
                separator = "➜",
                group = "+",
            },

            -- Configuração da janela
            win = {
                border = "rounded",
                padding = { 1, 2 },
            },

            -- Desabilitar em alguns tipos de arquivo
            disable = {
                ft = { "TelescopePrompt" },
            },
        })

        -- ================================
        -- Registrar grupos de teclas
        -- ================================
        wk.add({
            -- Leader groups
            { "<leader>b", group = "Buffer" },
            { "<leader>c", group = "Copy/Code" },
            { "<leader>f", group = "Find (Telescope)" },
            { "<leader>o", group = "Obsidian" },
            { "<leader>s", group = "Swap" },

            -- Descrições individuais
            { "<leader>w", desc = "Salvar arquivo" },
            { "<leader>q", desc = "Fechar janela" },
            { "<leader>e", desc = "Explorador (Oil)" },
            { "<leader>-", desc = "Oil no diretório atual" },

            -- Buffer
            { "<leader>bb", desc = "Listar buffers" },
            { "<leader>bn", desc = "Próximo buffer" },
            { "<leader>bp", desc = "Buffer anterior" },
            { "<leader>bd", desc = "Fechar buffer" },
            { "<leader><Tab>", desc = "Buffer Picker" },

            -- Copy
            { "<leader>cp", desc = "Copiar path absoluto" },
            { "<leader>cl", desc = "Copiar arquivo + linha" },

            -- Find (Telescope)
            { "<leader>ff", desc = "Buscar arquivos" },
            { "<leader>fb", desc = "Buscar buffers" },
            { "<leader>fg", desc = "Buscar texto (grep)" },

            -- Obsidian
            { "<leader>ot", desc = "Nota de hoje" },
            { "<leader>on", desc = "Próxima nota" },
            { "<leader>op", desc = "Nota anterior" },
            { "<leader>of", desc = "Buscar notas" },
            { "<leader>og", desc = "Buscar em notas" },

            -- Navegação
            { "[[", desc = "Função anterior" },
            { "]]", desc = "Próxima função" },

            -- Text Objects (mostrar no modo visual/operator)
            { mode = { "x", "o" }, "if", desc = "Dentro da função" },
            { mode = { "x", "o" }, "af", desc = "Função inteira" },
            { mode = { "x", "o" }, "ic", desc = "Dentro da classe" },
            { mode = { "x", "o" }, "ac", desc = "Classe inteira" },
            { mode = { "x", "o" }, "ia", desc = "Parâmetro" },
            { mode = { "x", "o" }, "ib", desc = "Dentro do bloco" },

            -- Comment
            { "gcc", desc = "Comentar linha" },
            { mode = "v", "gc", desc = "Comentar seleção" },
            { "gcO", desc = "Comentário acima" },
            { "gco", desc = "Comentário abaixo" },
            { "gcA", desc = "Comentário no final" },
        })
    end,
}
