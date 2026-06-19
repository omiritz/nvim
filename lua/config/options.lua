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
