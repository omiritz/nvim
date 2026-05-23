-- ================================
-- Comandos Customizados
-- ================================

-- Copiar todas as linhas que correspondem a um padrão
vim.api.nvim_create_user_command("CopyMatches", function(opts)
    local pattern = opts.args
    local bufnr = vim.api.nvim_get_current_buf()
    local matches = {}
    local lnum = 1
    local lastline = vim.api.nvim_buf_line_count(bufnr)

    while lnum <= lastline do
        local line = vim.api.nvim_buf_get_lines(bufnr, lnum - 1, lnum, false)[1]
        if vim.fn.match(line, pattern) ~= -1 then
            table.insert(matches, line)
        end
        lnum = lnum + 1
    end

    vim.fn.setreg("+", table.concat(matches, "\n"))
    print(string.format("Copiadas %d linhas para clipboard", #matches))
end, { nargs = 1, desc = "Copiar linhas que correspondem ao padrão" })

-- Contar ocorrências de um padrão
vim.api.nvim_create_user_command("CountMatches", function(opts)
    local pattern = opts.args:lower()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local count = 0

    for _, line in ipairs(lines) do
        line = line:lower()
        local start = 1
        while true do
            local s, e = line:find(pattern, start, true)
            if not s then break end
            count = count + 1
            start = e + 1
        end
    end

    print(string.format("Matches: %d", count))
end, { nargs = 1, desc = "Contar ocorrências de padrão" })
