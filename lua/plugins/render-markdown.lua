-- ================================
-- Render Markdown - Renderiza markdown no editor
-- ================================

return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown" }, -- Carrega apenas em arquivos markdown
    config = function()
        require("render-markdown").setup({
            -- Habilitar renderização
            enabled = true,

            -- Largura máxima do texto
            max_file_size = 10.0, -- MB

            -- Renderizar em todos os modos ou apenas em normal
            render_modes = { "n", "c" }, -- normal e command mode (não renderiza em insert)

            -- Headings (# ## ###)
            heading = {
                enabled = true,
                sign = true,
                icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
                width = "full",
                backgrounds = {
                    "RenderMarkdownH1Bg",
                    "RenderMarkdownH2Bg",
                    "RenderMarkdownH3Bg",
                    "RenderMarkdownH4Bg",
                    "RenderMarkdownH5Bg",
                    "RenderMarkdownH6Bg",
                },
                foregrounds = {
                    "RenderMarkdownH1",
                    "RenderMarkdownH2",
                    "RenderMarkdownH3",
                    "RenderMarkdownH4",
                    "RenderMarkdownH5",
                    "RenderMarkdownH6",
                },
            },

            -- Code blocks
            code = {
                enabled = true,
                sign = true,
                style = "full", -- 'full', 'normal', 'language', 'none'
                width = "block",
                left_pad = 0,
                right_pad = 0,
                border = "thin",
            },

            -- Links
            link = {
                enabled = true,
                image = "🖼️ ",
                hyperlink = "🔗 ",
                highlight = "RenderMarkdownLink",
            },

            -- Checkboxes
            checkbox = {
                enabled = true,
                unchecked = {
                    icon = "󰄱 ",
                    highlight = "RenderMarkdownUnchecked",
                },
                checked = {
                    icon = "󰱒 ",
                    highlight = "RenderMarkdownChecked",
                },
                custom = {
                    todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
                },
            },

            -- Bullet points
            bullet = {
                enabled = true,
                icons = { "●", "○", "◆", "◇" },
                highlight = "RenderMarkdownBullet",
            },

            -- Tabelas
            pipe_table = {
                enabled = true,
                style = "full", -- 'full', 'normal', 'none'
                cell = "padded",
                border = {
                    "┌", "┬", "┐",
                    "├", "┼", "┤",
                    "└", "┴", "┘",
                    "│", "─",
                },
            },

            -- Callouts (> [!NOTE])
            callout = {
                note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
                tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
                important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
                warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
                caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
            },

            -- Quote blocks (>)
            quote = {
                enabled = true,
                icon = "▋",
                highlight = "RenderMarkdownQuote",
            },

            -- Horizontal rules (---)
            dash = {
                enabled = true,
                icon = "─",
                width = "full",
                highlight = "RenderMarkdownDash",
            },
        })

        -- ================================
        -- Comandos e Keymaps
        -- ================================

        -- Comando para toggle
        vim.api.nvim_create_user_command("RenderMarkdown", function(opts)
            if opts.args == "toggle" then
                require("render-markdown").toggle()
            elseif opts.args == "enable" then
                require("render-markdown").enable()
            elseif opts.args == "disable" then
                require("render-markdown").disable()
            end
        end, {
            nargs = 1,
            complete = function()
                return { "toggle", "enable", "disable" }
            end,
            desc = "Controlar renderização de markdown",
        })

        -- Keymap para toggle
        vim.keymap.set("n", "<leader>mr", "<cmd>RenderMarkdown toggle<CR>", {
            desc = "Toggle Markdown Render",
        })
    end,
}
