local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.statuscolumn = ""
opt.laststatus = 2
opt.statusline = " %t %m %= %l:%c | %P "
opt.ruler = false
opt.showmode = true
opt.cmdheight = 1
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- find
opt.path = "**"
opt.wildmenu = true
opt.wildmode = "full"

-- files
opt.backup = false
opt.writebackup = false
opt.swapfile = false

opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.updatetime = 250
opt.timeoutlen = 500

opt.splitright = true
opt.splitbelow = true

opt.scrolloff = 8

opt.foldmethod = "indent"
opt.foldenable = false
opt.foldlevel = 99

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25

vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

vim.cmd("colorscheme wildcharm")

vim.g.mapleader = " "

-- keymaps
local keymap = vim.keymap.set

keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Salvar arquivo" })
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Fechar janela" })
keymap("n", "<leader>e", "<cmd>Explore<CR>", { desc = "Abrir explorador de arquivos" })

-- buffers
keymap("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Próximo buffer", silent = true })
keymap("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Buffer anterior", silent = true })

-- paths
keymap("n", "<leader>cp", function()
    vim.fn.setreg("+", vim.fn.expand("%:p"))
    print("Path copiado: " .. vim.fn.expand("%:p"))
end, { desc = "Copiar path absoluto" })

keymap("n", "<leader>cl", function()
    local file = vim.fn.expand("%:p")
    local line = vim.fn.line(".")
    local text = string.format("%s:%d", file, line)
    vim.fn.setreg("+", text)
    print("Copiado: " .. text)
end, { desc = "Copiar arquivo + linha" })
