return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon: Adicionar arquivo" },
        { "<leader>d", function() require("harpoon"):list():remove() end, desc = "Harpoon: Remover arquivo" },
        { "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon: Menu rápido" },
        { "<C-h>", function() require("harpoon"):list():select(1) end, desc = "Harpoon: Arquivo 1" },
        { "<C-j>", function() require("harpoon"):list():select(2) end, desc = "Harpoon: Arquivo 2" },
        { "<C-k>", function() require("harpoon"):list():select(3) end, desc = "Harpoon: Arquivo 3" },
        { "<C-l>", function() require("harpoon"):list():select(4) end, desc = "Harpoon: Arquivo 4" },
        { "<C-S-P>", function() require("harpoon"):list():prev() end, desc = "Harpoon: Anterior" },
        { "<C-S-N>", function() require("harpoon"):list():next() end, desc = "Harpoon: Próximo" },
    },
    config = function()
        require("harpoon"):setup()
    end,
}
