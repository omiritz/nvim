return {
    "folke/twilight.nvim",
    opts = {
        dimming = {
            alpha = 0.25, -- quantidade de dimming (escurecimento) para o código não focado
            color = { "Normal", "#ffffff" },
            term_bg = "#000000",
            inactive = false,
        },
        context = 10, -- número de linhas que consideramos como contexto
        treesitter = true, -- usa treesitter quando disponível para o contexto
        expand = {
            "function",
            "method",
            "table",
            "if_statement",
        },
        exclude = {}, -- excluir esses filetypes
    },
}
