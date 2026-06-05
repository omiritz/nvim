-- ================================
-- Treesitter - Syntax Highlighting
-- ================================

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("nvim-treesitter.config").setup({
            -- Linguagens para instalar automaticamente
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "markdown",
                "markdown_inline",
                "python",
                "java",
                "groovy",
                "javascript",
                "typescript",
                "html",
                "css",
                "json",
                "yaml",
                "bash",
                "go",
                "rust",
            },

            -- Instalar parsers de forma síncrona (apenas para ensure_installed)
            sync_install = false,

            -- Instalar parsers automaticamente quando abrir um arquivo
            auto_install = true,

            highlight = {
                enable = true,
                -- Desabilitar em arquivos grandes
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false,
            },

            indent = {
                enable = true,
            },

            -- Incrementar seleção com treesitter
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = "<C-s>",
                    node_decremental = "<C-backspace>",
                },
            },
        })

        -- ================================
        -- Text Objects (API nova)
        -- ================================
        require("nvim-treesitter-textobjects").setup({
            select = {
                lookahead = true,
                selection_modes = {
                    ["@function.outer"] = "V", -- linewise
                    ["@class.outer"] = "V",    -- linewise
                },
                include_surrounding_whitespace = false,
            },
        })

        -- Keymaps manuais (conforme nova API)
        local select = require("nvim-treesitter-textobjects.select").select_textobject

        -- Funções
        vim.keymap.set({ "x", "o" }, "if", function()
            select("@function.inner", "textobjects")
        end, { desc = "Selecionar dentro da função" })

        vim.keymap.set({ "x", "o" }, "af", function()
            select("@function.outer", "textobjects")
        end, { desc = "Selecionar função inteira" })

        -- Classes
        vim.keymap.set({ "x", "o" }, "ic", function()
            select("@class.inner", "textobjects")
        end, { desc = "Selecionar dentro da classe" })

        vim.keymap.set({ "x", "o" }, "ac", function()
            select("@class.outer", "textobjects")
        end, { desc = "Selecionar classe inteira" })

        -- Parâmetros
        vim.keymap.set({ "x", "o" }, "ia", function()
            select("@parameter.inner", "textobjects")
        end, { desc = "Selecionar parâmetro" })

        vim.keymap.set({ "x", "o" }, "aa", function()
            select("@parameter.outer", "textobjects")
        end, { desc = "Selecionar parâmetro com vírgula" })

        -- Blocos
        vim.keymap.set({ "x", "o" }, "ib", function()
            select("@block.inner", "textobjects")
        end, { desc = "Selecionar dentro do bloco" })

        vim.keymap.set({ "x", "o" }, "ab", function()
            select("@block.outer", "textobjects")
        end, { desc = "Selecionar bloco inteiro" })
    end,
}
