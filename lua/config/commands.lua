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

-- Insere DateTime abaixo do cursor e abre nova linha (como "o")
vim.api.nvim_create_user_command("Datetime", function()
  local datetime = os.date("%Y-%m-%d %H:%M:%S")
  -- Adiciona data/hora no final da linha atual
  vim.api.nvim_put({ datetime }, "c", true, true)
  -- Simula o comportamento do "o": nova linha abaixo e modo insert
  vim.cmd("normal! o")
end, {})


vim.api.nvim_create_user_command("CopyPath", function()
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local builtin = require("telescope.builtin")

  builtin.find_files({
    attach_mappings = function(prompt_bufnr, map)
      local copy_path = function()
        local selection = action_state.get_selected_entry()

        actions.close(prompt_bufnr)

        local path = selection.path or selection[1]

        -- caminho relativo ao cwd atual
        local relative = vim.fn.fnamemodify(path, ":.")

        vim.fn.setreg("+", relative)

        print("Copiado: " .. relative)
      end

      map("i", "<CR>", copy_path)
      map("n", "<CR>", copy_path)

      return true
    end,
  })
end, {})

