# Configuração Neovim

Configuração pessoal do Neovim focada em produtividade e simplicidade.

## Estrutura

```
.
├── init.lua                    # Ponto de entrada, carrega plugins e configurações
├── lua/
│   ├── config/
│   │   ├── options.lua        # Opções do editor
│   │   ├── keymaps.lua        # Atalhos de teclado
│   │   └── commands.lua       # Comandos customizados
│   ├── plugins/               # Configuração de plugins
│   │   ├── telescope.lua      # Fuzzy finder
│   │   ├── treesitter.lua     # Syntax highlighting
│   │   ├── oil.lua           # File explorer
│   │   ├── comment.lua       # Comentários
│   │   └── obsidian-daily.lua # Notas diárias
│   └── utils/
│       └── buffer-picker.lua  # Seletor rápido de buffers
└── .claude/settings.local.json
```

## Gerenciador de Plugins

Lazy.nvim com instalação automática no bootstrap.

## Plugins Instalados

### Telescope
Fuzzy finder para busca de arquivos e texto.
- `<leader>ff` - Buscar arquivos (layout vertical compacto)
- `<leader>fg` - Buscar texto (live grep)
- `:CopyPath` - Copiar path de arquivo via Telescope

Ignora automaticamente: `.git/`, `node_modules/`, `target/`, `__pycache__/`, `build/`, `dist/`

### Treesitter
Syntax highlighting avançado com análise de código.
- Linguagens: Lua, Vim, Python, Java, Groovy, JavaScript, TypeScript, HTML, CSS, JSON, YAML, Bash, Go, Rust
- Text objects: `if/af` (função), `ic/ac` (classe), `ia/aa` (parâmetro), `ib/ab` (bloco)
- Seleção incremental: `<C-space>` expandir, `<C-backspace>` reduzir

### Oil.nvim
File explorer no estilo buffer editável.
- `<leader>e` - Abrir Oil
- `<leader>-` - Abrir Oil no diretório atual
- `g.` - Toggle arquivos ocultos
- `gy` - Copiar path absoluto
- `gY` - Copiar path relativo

### Comment.nvim
Comentários rápidos.
- `gcc` - Comentar/descomentar linha
- `gc{motion}` - Comentar com movimento
- `gcO/gco/gcA` - Adicionar comentário acima/abaixo/final da linha

### Obsidian Daily
Plugin customizado para notas diárias no Obsidian.
- Auto-abre nota do dia ao entrar no diretório Obsidian
- `<leader>ot` - Abrir nota de hoje
- `<leader>on/op` - Nota próximo/anterior dia
- `<leader>of` - Buscar notas com Telescope
- `<leader>og` - Buscar conteúdo nas notas

## Configurações

### Aparência
- Tema: wildcharm
- Números de linha: absolutos + relativos
- Statusline customizada com cores por modo:
  - Normal: verde (#08CB00)
  - Insert: vermelho (#ef4444)
  - Visual: roxo (#a855f7)
- Comentários em itálico

### Indentação
- 4 espaços
- Tab expande para espaços
- Auto-indent e smart-indent ativos

### Comportamento
- Leader key: `<Space>`
- Clipboard integrado com sistema
- Sem arquivos de backup/swap
- Mouse habilitado
- Split: direita e abaixo por padrão
- Scroll offset: 8 linhas

### Busca
- Case insensitive com smart case
- Incremental search
- Highlight de resultados

## Atalhos Principais

### Arquivos
- `<leader>w` - Salvar arquivo
- `<leader>q` - Fechar janela
- `<leader>e` - Oil explorer
- `<leader>ff` - Telescope find files
- `<leader>fg` - Telescope grep

### Buffers
- `<Tab>` - Próximo buffer
- `<S-Tab>` - Buffer anterior
- `<leader><Tab>` - Buffer picker (seleção rápida com números 1-9)

### Copiar Paths
- `<leader>cp` - Copiar path absoluto
- `<leader>cl` - Copiar arquivo:linha

## Comandos Customizados

- `:CopyMatches <pattern>` - Copia todas as linhas que correspondem ao padrão
- `:Datetime` - Insere data/hora abaixo do cursor
- `:CopyPath` - Telescope para copiar path de arquivo
- `:ObsidianDaily` / `:Today` - Abrir nota diária
- `:BufferPicker` - Abrir seletor de buffers

## Compilador

Configurado para usar GCC (necessário para Treesitter compilar parsers no Windows).

## Desabilitado

Plugins built-in desabilitados para melhor performance:
- gzip, tarPlugin, tohtml, tutor, zipPlugin
- netrw (substituído por Oil)
