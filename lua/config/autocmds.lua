vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(args)
        local name = vim.api.nvim_buf_get_name(args.buf)

        if name:match("^https?://") then
            vim.bo[args.buf].filetype = "json"
        end
    end,
})


vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            focusable = false,
            border = "rounded",
            source = "if_many",
        })
    end,
})
