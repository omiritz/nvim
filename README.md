# Neovim Configuration

Configuração minimalista do Neovim em um único arquivo.

## Estrutura Anterior (arquivos removidos)

A configuração anterior usava múltiplos arquivos com plugins. Estrutura original:

```
.
├── init.lua                    # (antigo) Ponto de entrada com Lazy.nvim
├── lua/
│   ├── config/
│   │   ├── options.lua        # Opções do editor
│   │   ├── keymaps.lua        # Atalhos de teclado
│   │   ├── autocmds.lua       # Auto-comandos
│   │   ├── commands.lua       # Comandos customizados
│   ├── plugins/               # Configuração de plugins
│   │   ├── telescope.lua      # Fuzzy finder
│   │   ├── treesitter.lua     # Syntax highlighting
│   │   ├── treesitter-context.lua
│   │   ├── oil.lua            # File explorer
│   │   ├── blink.lua          # Autocompletar
│   │   ├── illuminate.lua     # Destacar ocorrências
│   │   ├── twilight.lua       # Foco no código
│   │   ├── lsp.lua            # LSP config
│   │   └── obsidian-daily.lua # Notas diárias
│   └── utils/
│       └── buffer-picker.lua  # Seletor rápido de buffers
├── colors/
│   └── matrix.lua             # (antigo) Tema customizado
└── init-old.lua               # Backup da config antiga
```

## Estrutura Atual

```
.
├── init.lua                   # Configuração única (sem plugins)
├── README.md                  # Este arquivo
└── TODO.md                    # Tarefas pendientes
```

## Configuração Atual (init.lua)

### Opções do Editor

- Números de linha absolutos e relativos
- Cursorline, statusline customizada
- Indentação: 2 espaços, expandtab
- Busca: ignorecase, smartcase, hlsearch
- Split: right e below
- Scroll: 8 linhas de offset

### Atalhos

| Atalho | Função |
|--------|--------|
| `<leader>w` | Salvar arquivo |
| `<leader>q` | Fechar janela |
| `<leader>e` | Netrw (explorador de arquivos) |
| `<Tab>` | Próximo buffer |
| `<S-Tab>` | Buffer anterior |
| `<leader>cp` | Copiar path absoluto |
| `<leader>cl` | Copiar arquivo:linha |

## Plugins Removidos

- **Telescope** - Fuzzy finder
- **Treesitter** - Syntax highlighting
- **Treesitter Context** - Contexto no topo
- **Oil** - File explorer
- **Blink.cmp** - Autocompletar
- **Illuminate** - Destacar ocorrências
- **Twilight** - Foco no código
- **Mason + LSP** - Language Server
- **Obsidian Daily** - Notas diárias
- **retrobox.nvim** - Tema

## Netrw

Explorador de arquivos nativo do Vim/Neovim:
- Banner desabilitado
- Tree view (liststyle 3)
- 25% de largura

Executar `:Explore` ou `<leader>e`.