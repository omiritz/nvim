-- ================================
-- Neovim Configuration
-- Fernando Konflanz
-- ================================

-- Leader key (precisa ser definido antes de carregar plugins)
vim.g.mapleader = " "

-- ================================
-- Bootstrap do Lazy.nvim
-- ================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- ================================
-- Carregar Plugins
-- ================================
require("lazy").setup("plugins", {
    checker = {
        enabled = false, -- Não verificar updates automaticamente
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

-- ================================
-- Carregar Configurações
-- ================================
require("config.options")
require("config.keymaps")
require("config.commands")

-- ================================
-- Tema e Aparência
-- ================================
vim.cmd("colorscheme retrobox")
vim.cmd("highlight Comment gui=italic")
