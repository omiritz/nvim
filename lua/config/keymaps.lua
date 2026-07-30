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
-- Explorador de Arquivos (Oil)
-- ================================
keymap("n", "<leader>e", "<cmd>Oil<CR>", {
    noremap = true,
    silent = true,
    desc = "Abrir explorador de arquivos (Oil)"
})

-- Abrir oil no diretório do arquivo atual
keymap("n", "<leader>-", function()
    require("oil").open()
end, {
    desc = "Abrir Oil no diretório atual"
})


-- ================================
-- Gerenciamento de Buffers
-- ================================
-- Navegação entre buffers com Tab
keymap("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Próximo buffer", silent = true })
keymap("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Buffer anterior", silent = true })


-- Buffer Picker - Seleção rápida com números
keymap("n", "<leader><Tab>", function()
    require("utils.buffer-picker").open()
end, { desc = "Abrir Buffer Picker" })

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
-- Twilight
-- ================================
keymap("n", "<leader>tw", "<cmd>Twilight<CR>", { desc = "Toggle Twilight" })

-- ================================
-- Telescope
-- ================================
-- ff e fb estão configurados no telescope.lua com layout vertical compacto
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Buscar texto" })

vim.keymap.set("n", "<leader>jq", function()
    vim.bo.filetype = "json"
    vim.cmd("%!jq .")
end, { desc = "Formatar JSON com jq" })


vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
    desc = "Code Action"
})
