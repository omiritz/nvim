-- ================================
-- Treesitter - Syntax Highlighting
-- ================================

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({
            -- Linguagens para instalar automaticamente
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "markdown",
                "markdown_inline",
                "python",
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
    end,
}
