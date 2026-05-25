# 📋 TODO: Instalação de Plugins

## ✅ Checklist de Instalação

### 1. 🎯 Harpoon - Navegação rápida entre arquivos
- [ ] Criar arquivo `lua/plugins/harpoon.lua`
- [ ] Adicionar configuração do Harpoon 2
- [ ] Configurar atalhos de teclado
- [ ] Testar marcação e navegação entre arquivos

### 2. 📝 Obsidian.nvim - Integração com Obsidian
- [ ] Criar arquivo `lua/plugins/obsidian.lua`
- [ ] Configurar vault do Obsidian
- [ ] Definir templates e diretórios
- [ ] Configurar atalhos para notas
- [ ] Testar criação e navegação de notas

### 3. 🎨 Markdown - Visualização aprimorada
- [ ] Criar arquivo `lua/plugins/markdown.lua`
- [ ] Instalar `render-markdown.nvim` (preview em tempo real)
- [ ] Instalar `markdown-preview.nvim` (preview no navegador)
- [ ] Configurar sintaxe e highlighting
- [ ] Testar preview e renderização

### 4. 📁 Yazi - File Manager integrado
- [ ] Criar arquivo `lua/plugins/yazi.lua`
- [ ] Configurar abertura com `<leader>e`
- [ ] Testar navegação e seleção de arquivos
- [ ] Verificar integração com terminal flutuante

---

## 📦 1. Instalação do Harpoon

### Arquivo: `lua/plugins/harpoon.lua`

```lua
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        
        -- REQUIRED: Setup
        harpoon:setup()

        -- Atalhos de teclado
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, 
            { desc = "Harpoon: Adicionar arquivo" })
        
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Harpoon: Menu rápido" })

        -- Navegar entre arquivos marcados (1-4)
        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end,
            { desc = "Harpoon: Arquivo 1" })
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end,
            { desc = "Harpoon: Arquivo 2" })
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end,
            { desc = "Harpoon: Arquivo 3" })
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end,
            { desc = "Harpoon: Arquivo 4" })

        -- Navegar para próximo/anterior
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end,
            { desc = "Harpoon: Anterior" })
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end,
            { desc = "Harpoon: Próximo" })
    end,
}
```

### Como usar:
- `<leader>a` - Adiciona arquivo atual aos favoritos
- `<C-e>` - Abre menu com todos os arquivos marcados
- `<C-h/j/k/l>` - Vai direto para arquivo 1/2/3/4
- `<C-S-P/N>` - Navega entre arquivos marcados

---

## 📦 2. Instalação do Obsidian.nvim

### Arquivo: `lua/plugins/obsidian.lua`

```lua
return {
    "epwalsh/obsidian.nvim",
    version = "*",  -- Use latest release
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("obsidian").setup({
            -- IMPORTANTE: Ajuste para o caminho do seu vault do Obsidian
            workspaces = {
                {
                    name = "personal",
                    path = "~/Documents/ObsidianVault",  -- MUDE AQUI!
                },
                {
                    name = "work",
                    path = "~/Documents/WorkNotes",  -- Opcional: vault de trabalho
                },
            },

            -- Configurações de notas
            notes_subdir = "notes",
            daily_notes = {
                folder = "daily",
                date_format = "%Y-%m-%d",
                alias_format = "%B %-d, %Y",
            },

            -- Como criar novos arquivos
            note_id_func = function(title)
                -- Se título fornecido, usa como nome do arquivo
                if title ~= nil then
                    return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                    -- Caso contrário, usa timestamp
                    return tostring(os.time())
                end
            end,

            -- Templates
            templates = {
                subdir = "templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M",
            },

            -- Mapeamento de atalhos
            mappings = {
                -- Seguir link (gf no modo normal)
                ["gf"] = {
                    action = function()
                        return require("obsidian").util.gf_passthrough()
                    end,
                    opts = { noremap = false, expr = true, buffer = true },
                },
                -- Toggle checkbox
                ["<leader>ch"] = {
                    action = function()
                        return require("obsidian").util.toggle_checkbox()
                    end,
                    opts = { buffer = true },
                },
            },

            -- Autocompletar [[links]]
            completion = {
                nvim_cmp = true,
                min_chars = 2,
            },
        })

        -- Atalhos globais
        vim.keymap.set("n", "<leader>on", ":ObsidianNew ", { desc = "Obsidian: Nova nota" })
        vim.keymap.set("n", "<leader>oo", ":ObsidianSearch<CR>", { desc = "Obsidian: Buscar nota" })
        vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", { desc = "Obsidian: Nota diária" })
        vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "Obsidian: Backlinks" })
        vim.keymap.set("n", "<leader>ol", ":ObsidianLink<CR>", { desc = "Obsidian: Criar link" })
        vim.keymap.set("n", "<leader>of", ":ObsidianFollowLink<CR>", { desc = "Obsidian: Seguir link" })
    end,
}
```

### Como usar:
- `<leader>on` - Criar nova nota
- `<leader>oo` - Buscar notas (integra com Telescope)
- `<leader>ot` - Abrir nota do dia
- `gf` - Seguir link do Obsidian
- `<leader>ch` - Toggle checkbox em listas

### ⚠️ Antes de usar:
1. Ajuste o caminho do vault em `workspaces.path`
2. Crie as pastas no seu vault:
   - `notes/` - Para notas gerais
   - `daily/` - Para notas diárias
   - `templates/` - Para templates

---

## 📦 3. Instalação de Plugins Markdown

### Arquivo: `lua/plugins/markdown.lua`

```lua
return {
    -- Plugin 1: Render Markdown em tempo real no buffer
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { 
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons" 
        },
        ft = "markdown",
        config = function()
            require("render-markdown").setup({
                -- Habilita rendering
                enabled = true,
                
                -- Mostra ícones de bullet points
                bullet = {
                    enabled = true,
                    icons = { "●", "○", "◆", "◇" },
                },
                
                -- Checkboxes bonitos
                checkbox = {
                    enabled = true,
                    unchecked = "󰄱 ",
                    checked = " ",
                },
                
                -- Headers com diferentes tamanhos
                heading = {
                    enabled = true,
                    sign = true,
                    icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
                },
                
                -- Code blocks destacados
                code = {
                    enabled = true,
                    sign = true,
                    style = "full",
                    left_pad = 2,
                    right_pad = 2,
                },
                
                -- Destaque de links
                link = {
                    enabled = true,
                    image = "󰥶 ",
                    hyperlink = "󰌹 ",
                },
            })

            -- Toggle render markdown
            vim.keymap.set("n", "<leader>mr", ":RenderMarkdown toggle<CR>", 
                { desc = "Markdown: Toggle render" })
        end,
    },

    -- Plugin 3: Melhor syntax highlighting (via Treesitter)
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "markdown", "markdown_inline" },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },
}
```

### Como usar:
- `<leader>mr` - Liga/desliga renderização no buffer
- `<leader>mt` - Toggle preview no navegador
- `<leader>ms` - Para preview

---

## 🚀 Instalação Rápida

### Passo a Passo:

1. **Criar os 3 arquivos de plugins**:
   ```bash
   cd ~/AppData/Local/nvim/lua/plugins
   # Copie o conteúdo acima para cada arquivo
   ```

2. **Ajustar configuração do Obsidian**:
   - Edite `lua/plugins/obsidian.lua`
   - Mude `path = "~/Documents/ObsidianVault"` para seu vault

3. **Recarregar Neovim**:
   - Feche e abra o Neovim
   - Lazy.nvim vai instalar automaticamente
   - Ou execute `:Lazy sync`

4. **Verificar instalação**:
   - `:Lazy` - Ver status dos plugins
   - `:checkhealth obsidian` - Verificar Obsidian
   - Abra um arquivo `.md` para testar

---

## 🎯 Resumo dos Atalhos

### Harpoon
| Atalho | Ação |
|--------|------|
| `<leader>a` | Adicionar arquivo aos favoritos |
| `<C-e>` | Menu de arquivos marcados |
| `<C-h/j/k/l>` | Ir para arquivo 1/2/3/4 |

### Obsidian
| Atalho | Ação |
|--------|------|
| `<leader>on` | Nova nota |
| `<leader>oo` | Buscar nota |
| `<leader>ot` | Nota diária |
| `gf` | Seguir link |
| `<leader>ch` | Toggle checkbox |

### Markdown
| Atalho | Ação |
|--------|------|
| `<leader>mr` | Toggle render inline |
| `<leader>mp` | Preview no navegador |
| `<leader>mt` | Toggle preview |

---

## 📦 4. Instalação do Yazi (File Manager)

### Arquivo: `lua/plugins/yazi.lua`

```lua
return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>e",
            "<cmd>Yazi<cr>",
            desc = "Abrir Yazi (File Manager)",
        },
        {
            "<leader>E",
            "<cmd>Yazi cwd<cr>",
            desc = "Abrir Yazi no diretório atual",
        },
    },
    opts = {
        -- Abre em janela flutuante
        open_for_directories = false,
        
        -- Configuração da janela flutuante
        yazi_floating_window_winblend = 0,
        yazi_floating_window_border = "rounded",
        
        -- Keybindings dentro do Yazi
        keymaps = {
            show_help = "<f1>",
            open_file_in_vertical_split = "<c-v>",
            open_file_in_horizontal_split = "<c-x>",
            open_file_in_tab = "<c-t>",
            grep_in_directory = "<c-s>",
            replace_in_directory = "<c-g>",
            cycle_open_buffers = "<tab>",
            copy_relative_path_to_selected_files = "<c-y>",
            send_to_quickfix_list = "<c-q>",
        },
        
        -- Integração com o sistema
        use_ya_for_events_reading = true,
        use_yazi_client_id_flag = true,
        
        -- Hooks - executados após ações
        hooks = {
            yazi_opened = function()
                -- Opcional: fazer algo quando Yazi abre
            end,
            yazi_closed_successfully = function()
                -- Opcional: fazer algo quando Yazi fecha
            end,
        },
    },
}
```

### Pré-requisitos:
**Yazi deve estar instalado no sistema!**

#### Windows (Scoop ou Chocolatey):
```bash
# Com Scoop
scoop install yazi

# Com Chocolatey
choco install yazi

# Com WinGet
winget install sxyazi.yazi
```

#### Linux:
```bash
# Arch
sudo pacman -S yazi

# Ubuntu/Debian (via cargo)
cargo install --locked yazi-fm

# Ou via release
curl -fsSL https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.tar.gz | tar xz
```

#### macOS:
```bash
brew install yazi
```

### Como usar:
- `<leader>e` - Abre Yazi na pasta do arquivo atual
- `<leader>E` - Abre Yazi no diretório de trabalho (cwd)

### Navegação dentro do Yazi:
| Tecla | Ação |
|-------|------|
| `j/k` ou `↓/↑` | Navegar arquivos |
| `h/l` ou `←/→` | Subir/descer diretório |
| `Enter` | Abrir arquivo no Neovim |
| `<C-v>` | Abrir em split vertical |
| `<C-x>` | Abrir em split horizontal |
| `<C-t>` | Abrir em nova aba |
| `<C-y>` | Copiar caminho relativo |
| `q` ou `Esc` | Fechar Yazi |
| `<F1>` | Mostrar ajuda |

### Recursos do Yazi:
- 📁 Navegação visual de diretórios
- 🖼️ Preview de imagens e arquivos
- 🔍 Busca fuzzy integrada
- 📋 Copiar/mover/deletar arquivos
- 🎨 Interface moderna e rápida
- ⚡ Escrito em Rust (super rápido!)

### Configuração avançada (opcional):

Se quiser customizar o Yazi, crie `~/.config/yazi/yazi.toml`:

```toml
[manager]
show_hidden = true
sort_by = "modified"
sort_reverse = true
linemode = "size"

[preview]
tab_size = 2
max_width = 600
max_height = 900
```

---

## 🎯 Resumo dos Atalhos (Atualizado)

### Harpoon
| Atalho | Ação |
|--------|------|
| `<leader>a` | Adicionar arquivo aos favoritos |
| `<C-e>` | Menu de arquivos marcados |
| `<C-h/j/k/l>` | Ir para arquivo 1/2/3/4 |

### Obsidian
| Atalho | Ação |
|--------|------|
| `<leader>on` | Nova nota |
| `<leader>oo` | Buscar nota |
| `<leader>ot` | Nota diária |
| `gf` | Seguir link |
| `<leader>ch` | Toggle checkbox |

### Markdown
| Atalho | Ação |
|--------|------|
| `<leader>mr` | Toggle render inline |
| `<leader>mp` | Preview no navegador |
| `<leader>mt` | Toggle preview |

### Yazi (Novo!)
| Atalho | Ação |
|--------|------|
| `<leader>e` | Abrir Yazi na pasta atual |
| `<leader>E` | Abrir Yazi no cwd |

---

## 🐛 Troubleshooting

### Harpoon não funciona
```vim
:Lazy reload harpoon
```

### Obsidian não encontra vault
- Verifique o caminho em `workspaces.path`
- Use caminho absoluto completo
- No Windows: `C:/Users/seu-usuario/Documents/ObsidianVault`

### Markdown preview não abre
```vim
:call mkdp#util#install()
```

### Render markdown não mostra ícones
- Instale uma Nerd Font (ex: JetBrainsMono Nerd Font)
- Configure seu terminal para usar a fonte

### Yazi não abre
```bash
# Verifique se Yazi está instalado
yazi --version

# Se não estiver, instale:
# Windows: scoop install yazi
# Linux: ver seção de pré-requisitos
# macOS: brew install yazi
```

### Yazi abre mas não funciona
- Verifique se o terminal suporta UI (não funciona em terminal básico do Windows)
- Use Windows Terminal, WezTerm, Alacritty ou outro terminal moderno
- Execute `:checkhealth yazi` no Neovim

---

## 📚 Referências

- [Harpoon GitHub](https://github.com/ThePrimeagen/harpoon)
- [Obsidian.nvim Docs](https://github.com/epwalsh/obsidian.nvim)
- [Render Markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim)
- [Markdown Preview](https://github.com/iamcco/markdown-preview.nvim)
- [Yazi.nvim Plugin](https://github.com/mikavilpas/yazi.nvim)
- [Yazi File Manager](https://github.com/sxyazi/yazi)

---

**Criado em**: 2026-05-25  
**Última atualização**: 2026-05-25
