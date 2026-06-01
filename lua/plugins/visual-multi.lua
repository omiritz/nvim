-- ================================
-- vim-visual-multi
-- Múltiplos cursores (similar ao VS Code)
-- ================================

return {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "VeryLazy",
    init = function()
        -- Configurações devem ser feitas antes do plugin carregar
        vim.g.VM_theme = "purplegray"
        vim.g.VM_mouse_mappings = 1

        -- Desabilitar alguns mappings padrão que podem conflitar
        vim.g.VM_maps = {
            ["Find Under"] = "<C-d>",           -- Ctrl+d: adiciona cursor na próxima ocorrência
            ["Find Subword Under"] = "<C-d>",
            ["Select All"] = "<C-S-l>",         -- Ctrl+Shift+l: seleciona todas ocorrências
            ["Skip Region"] = "<C-x>",          -- Ctrl+x: pula ocorrência atual
            ["Remove Region"] = "<C-p>",        -- Ctrl+p: remove cursor atual
            ["Add Cursor Down"] = "<C-Down>",   -- Ctrl+Down: adiciona cursor abaixo
            ["Add Cursor Up"] = "<C-Up>",       -- Ctrl+Up: adiciona cursor acima
            ["Undo"] = "u",
            ["Redo"] = "<C-r>",
        }
    end,
}
