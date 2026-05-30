-- ================================
-- Atalhos de Teclado
-- ================================

local keymap = vim.keymap.set

-- Leader key
vim.g.mapleader = " "

-- ================================
-- Salvar e Sair
-- ================================
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Salvar arquivo" })
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Fechar janela" })

-- ================================
-- Explorador de Arquivos (netrw)
-- ================================
keymap("n", "<leader>e", ":Ex<CR>", {
    noremap = true,
    silent = true,
    desc = "Abrir explorador de arquivos"
})


-- ================================
-- Gerenciamento de Buffers
-- ================================
keymap("n", "<leader>bb", ":buffers<CR>:buffer<Space>", { desc = "Listar e escolher buffer" })
keymap("n", "<leader>bn", ":bnext<CR>", { desc = "Próximo buffer" })
keymap("n", "<leader>bp", ":bprevious<CR>", { desc = "Buffer anterior" })
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Fechar buffer atual" })
keymap("n", "<Tab>", ":bnext<CR>", { desc = "Próximo buffer" })
keymap("n", "<S-Tab>", ":bprevious<CR>", { desc = "Buffer anterior" })

-- ================================
-- Copiar Paths
-- ================================
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


-- ================================
-- Telescope
-- ================================
-- ff e fb estão configurados no telescope.lua com layout vertical compacto
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Buscar texto" })
