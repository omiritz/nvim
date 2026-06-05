-- ================================
-- Auto Tag (HTML/JSX)
-- ================================
-- Auto-fecha e renomeia tags HTML/JSX

return {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "xml" },
    config = function()
        require("nvim-ts-autotag").setup({
            opts = {
                enable_close = true,       -- Auto fecha tags
                enable_rename = true,      -- Renomeia tag par automaticamente
                enable_close_on_slash = false, -- Auto fecha em />
            },
        })
    end,
}
