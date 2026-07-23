return {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("illuminate").configure({
            delay = 200,
            under_cursor = false,
        })
        vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Search" })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Search" })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Search" })
    end,
}
