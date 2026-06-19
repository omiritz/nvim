-- ================================
-- Opções Básicas do Neovim
-- ================================

local opt = vim.opt

-- Aparência
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
opt.statuscolumn = ""
opt.laststatus = 0  -- Desabilita statusline (0=nunca, 2=sempre, 3=global)
opt.ruler = true    -- Mostra posição do cursor (linha, coluna)
opt.showmode = false  -- Oculta o modo (-- INSERT --)
opt.cmdheight = 1   -- Altura da linha de comando
opt.conceallevel = 1
opt.showmatch = true
opt.matchtime = 2

-- Indentação
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Quebra de linha
opt.wrap = false

-- Busca
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Arquivos
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Comportamento
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.updatetime = 250
opt.timeoutlen = 500  -- Tempo de espera para keymaps compostos (ms)

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Scroll
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Folding
opt.foldmethod = "indent"
opt.foldenable = false
opt.foldlevel = 99

-- Compilador C (para Treesitter)
vim.env.CC = "gcc"

-- Desabilitar netrw (usamos Oil)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Syntax
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- Customização de cores da statusline/ruler por modo
-- Define as cores para cada modo
local function set_mode_colors()
    local mode = vim.fn.mode()

    if mode == "n" then
        -- Modo Normal: vermelho com texto branco
        vim.api.nvim_set_hl(0, "MsgArea", { bg = "#ef4444", fg = "#ffffff" })
    elseif mode == "i" then
        -- Modo Insert: azul com texto branco
        vim.api.nvim_set_hl(0, "MsgArea", { bg = "#3b82f6", fg = "#ffffff" })
    elseif mode == "v" or mode == "V" or mode == "\22" then
        -- Modo Visual/Visual Line/Visual Block: roxo com texto branco
        vim.api.nvim_set_hl(0, "MsgArea", { bg = "#a855f7", fg = "#ffffff" })
    else
        -- Outros modos: cor padrão
        vim.api.nvim_set_hl(0, "MsgArea", { bg = "#1e1e2e", fg = "#ffffff" })
    end
end

-- Aplica cor inicial
set_mode_colors()

-- Atualiza cor quando o modo muda
vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*",
    callback = set_mode_colors,
})
