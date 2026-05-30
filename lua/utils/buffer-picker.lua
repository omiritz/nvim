-- ================================
-- Buffer Picker - Seleção rápida de buffers
-- ================================

local M = {}

-- Estado do picker
local picker_buf = nil
local picker_win = nil
local original_win = nil
local current_buffers = {}

-- Função para obter lista de buffers válidos
local function get_valid_buffers()
    local buffers = {}
    local current_buf = vim.api.nvim_get_current_buf()

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
            local name = vim.api.nvim_buf_get_name(buf)
            if name ~= "" then
                name = vim.fn.fnamemodify(name, ":~:.")
            else
                name = "[No Name]"
            end

            local modified = vim.bo[buf].modified and " [+]" or ""
            local is_current = buf == current_buf and " (atual)" or ""

            table.insert(buffers, {
                bufnr = buf,
                name = name,
                modified = modified,
                is_current = is_current,
            })
        end
    end

    return buffers
end

-- Função para criar linhas do display
local function create_display_lines(buffers)
    local lines = {}
    local max_items = math.min(#buffers, 9)

    -- Calcular largura necessária
    local max_length = 0
    for i = 1, max_items do
        local buf = buffers[i]
        local num = tostring(i)
        local content = string.format("  %s  %s%s%s  ", num, buf.name, buf.modified, buf.is_current)
        max_length = math.max(max_length, vim.fn.strdisplaywidth(content))
    end

    -- Garantir largura mínima
    max_length = math.max(max_length, 40)

    -- Criar linhas com bordas consistentes
    local top_border = "╭" .. string.rep("─", max_length) .. "╮"
    local bottom_border = "╰" .. string.rep("─", max_length) .. "╯"

    table.insert(lines, top_border)

    for i = 1, max_items do
        local buf = buffers[i]
        local num = tostring(i)
        local content = string.format("  %s  %s%s%s", num, buf.name, buf.modified, buf.is_current)

        -- Calcular padding necessário
        local content_width = vim.fn.strdisplaywidth(content)
        local padding = max_length - content_width

        local line = "│" .. content .. string.rep(" ", padding) .. "│"
        table.insert(lines, line)
    end

    table.insert(lines, bottom_border)

    return lines, max_length + 2 -- +2 para as bordas
end

-- Função para fechar o picker
local function close_picker()
    if picker_win and vim.api.nvim_win_is_valid(picker_win) then
        vim.api.nvim_win_close(picker_win, true)
    end
    if picker_buf and vim.api.nvim_buf_is_valid(picker_buf) then
        vim.api.nvim_buf_delete(picker_buf, { force = true })
    end
    picker_win = nil
    picker_buf = nil
    current_buffers = {}

    -- Restaurar foco para janela original
    if original_win and vim.api.nvim_win_is_valid(original_win) then
        vim.api.nvim_set_current_win(original_win)
    end
end

-- Função para deletar buffer
local function delete_buffer(index)
    if index > 0 and index <= #current_buffers then
        local bufnr = current_buffers[index].bufnr

        -- Deletar o buffer
        vim.api.nvim_buf_delete(bufnr, { force = false })

        -- Reabrir o picker com buffers atualizados
        close_picker()
        vim.schedule(function()
            M.open()
        end)
    end
end

-- Função para selecionar buffer
local function select_buffer(index)
    if index > 0 and index <= #current_buffers then
        local bufnr = current_buffers[index].bufnr
        close_picker()

        -- Mudar para o buffer selecionado
        if original_win and vim.api.nvim_win_is_valid(original_win) then
            vim.api.nvim_set_current_win(original_win)
        end
        vim.api.nvim_set_current_buf(bufnr)
    end
end

-- Função para criar janela flutuante
local function create_float_window(buffers)
    current_buffers = buffers
    local lines, width = create_display_lines(buffers)
    local height = #lines

    -- Calcular posição centralizada
    local ui = vim.api.nvim_list_uis()[1]
    local win_width = ui.width
    local win_height = ui.height

    local col = math.floor((win_width - width) / 2)
    local row = math.floor((win_height - height) / 2)

    -- Criar buffer
    picker_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(picker_buf, 0, -1, false, lines)

    -- Configurar opções do buffer
    vim.bo[picker_buf].modifiable = false
    vim.bo[picker_buf].bufhidden = "wipe"
    vim.bo[picker_buf].filetype = "buffer-picker"

    -- Criar janela flutuante
    picker_win = vim.api.nvim_open_win(picker_buf, true, {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        border = "none",
        focusable = true,
        zindex = 50,
    })

    -- Configurar highlights
    vim.api.nvim_win_set_option(picker_win, "winhl", "Normal:Normal")
    vim.api.nvim_win_set_option(picker_win, "winblend", 0)

    -- Configurar keymaps
    local opts = { buffer = picker_buf, noremap = true, silent = true, nowait = true }

    -- Números 1-9 para seleção
    for i = 1, 9 do
        vim.keymap.set("n", tostring(i), function()
            select_buffer(i)
        end, opts)
    end

    -- dd para deletar buffer
    vim.keymap.set("n", "dd", function()
        local line = vim.api.nvim_win_get_cursor(picker_win)[1]
        local index = line - 1 -- -1 para pular a borda superior
        if index > 0 and index <= #current_buffers then
            delete_buffer(index)
        end
    end, opts)

    -- Fechar com q ou Esc
    vim.keymap.set("n", "q", close_picker, opts)
    vim.keymap.set("n", "<Esc>", close_picker, opts)
    vim.keymap.set("n", "<C-c>", close_picker, opts)

    -- Auto-fechar ao perder foco
    vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
        buffer = picker_buf,
        once = true,
        callback = close_picker,
    })

    -- Posicionar cursor na primeira linha de buffer (pular borda)
    vim.api.nvim_win_set_cursor(picker_win, { 2, 0 })
end

-- Função principal para abrir o picker
function M.open()
    -- Salvar janela atual
    original_win = vim.api.nvim_get_current_win()

    -- Obter buffers válidos
    local buffers = get_valid_buffers()

    if #buffers == 0 then
        print("Nenhum buffer aberto")
        return
    end

    if #buffers == 1 then
        print("Apenas um buffer aberto")
        return
    end

    -- Criar janela do picker
    create_float_window(buffers)
end

-- Configurar comando
vim.api.nvim_create_user_command("BufferPicker", M.open, {})

-- Retornar o módulo para ser usado via require
return M
