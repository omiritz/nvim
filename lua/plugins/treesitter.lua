return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        vim.env.PATH = "C:\\TEMP\\tree-sitter;" .. vim.env.PATH

        require("nvim-treesitter.install").prefer_git = false
        require("nvim-treesitter.install").compilers = { "gcc" }

        -- Força ativação do highlighting
        vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
            callback = function(ev)
                local ft = vim.bo[ev.buf].filetype
                local bt = vim.bo[ev.buf].buftype

                -- Ignora buffers especiais
                if ft == "" or ft == "oil" or ft == "TelescopePrompt" or bt ~= "" then
                    return
                end

                local lang = vim.treesitter.language.get_lang(ft)
                if lang then
                    pcall(vim.treesitter.start, ev.buf, lang)
                end
            end,
        })
    end,
}
