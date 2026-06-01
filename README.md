# Configuração do Neovim

Configuração pessoal do Neovim focada em desenvolvimento com **Python**, **Groovy**, **Java**, **Node.js**, **Docker** e documentação em **Markdown**.

## 📁 Estrutura

```
nvim/
├── init.lua                       # Entrada principal
├── lua/
│   ├── config/
│   │   ├── options.lua           # Configurações do Neovim
│   │   ├── keymaps.lua           # Atalhos de teclado
│   │   └── commands.lua          # Comandos customizados
│   ├── utils/
│   │   └── buffer-picker.lua     # Seletor de buffers numerado
│   └── plugins/
│       ├── telescope.lua         # Fuzzy finder
│       ├── oil.lua               # File explorer
│       ├── obsidian-daily.lua    # Notas diárias Obsidian
│       └── visual-multi.lua      # Múltiplos cursores
└── README.md
```

## 🔧 Tecnologias

- **Neovim**: v0.13.0-dev
- **Plugin Manager**: lazy.nvim
- **Python**: 3.9
- **Java**: OpenJDK 21
- **Node.js**: 24.11.1

## 📦 Plugins Instalados

- **telescope.nvim** - Fuzzy finder para arquivos e busca de texto
- **plenary.nvim** - Biblioteca de utilitários (dependência do Telescope)
- **oil.nvim** - File explorer com edição inline de arquivos
- **nvim-web-devicons** - Ícones para tipos de arquivo
- **vim-visual-multi** - Edição com múltiplos cursores (similar ao VS Code)
- **obsidian-daily** - Plugin customizado para notas diárias do Obsidian

## ⌨️ Atalhos Principais

**Leader Key**: `<Space>`

### Arquivos
- `<leader>w` - Salvar arquivo
- `<leader>q` - Fechar janela
- `<leader>e` - Abrir Oil (file explorer)
- `<leader>-` - Abrir Oil no diretório do arquivo atual

### Busca (Telescope)
- `<leader>ff` - Buscar arquivos (layout vertical compacto)
- `<leader>fg` - Buscar texto (live grep)
- `<leader>fb` - Listar buffers abertos (layout vertical compacto)

### Buffers
- `<leader><Tab>` - Abrir Buffer Picker (seleção numerada)
- `<Tab>` - Próximo buffer
- `<Shift-Tab>` - Buffer anterior
- `<leader>bd` - Fechar buffer atual
- `<leader>bb` - Listar e escolher buffer

### Copiar Paths
- `<leader>cp` - Copiar path absoluto do arquivo atual
- `<leader>cl` - Copiar path + número da linha atual

### Oil (File Explorer)
Quando estiver no Oil:
- `<CR>` - Abrir arquivo/pasta
- `<C-s>` - Abrir em split vertical
- `<C-h>` - Abrir em split horizontal
- `-` - Subir um diretório
- `g.` - Mostrar/ocultar arquivos ocultos
- `gy` - Copiar path absoluto do arquivo sob o cursor
- `gY` - Copiar path relativo do arquivo sob o cursor
- `g?` - Mostrar todos os atalhos

### Múltiplos Cursores (vim-visual-multi)
- `<C-d>` - Adicionar cursor na próxima ocorrência da palavra
- `<C-Down>` - Adicionar cursor na linha abaixo
- `<C-Up>` - Adicionar cursor na linha acima
- `<C-Shift-L>` - Selecionar todas as ocorrências
- `<C-x>` - Pular ocorrência atual
- `<Tab>` - Alternar entre modo cursor/extend
- `q` - Remover cursor atual
- `Q` - Remover todos os cursores
- `<Esc>` - Sair do modo de múltiplos cursores

### Obsidian Daily Notes
- `<leader>ot` - Abrir nota de hoje
- `<leader>on` - Ir para próximo dia
- `<leader>op` - Ir para dia anterior
- `<leader>of` - Buscar notas diárias (Telescope)
- `<leader>og` - Buscar conteúdo nas notas

## 🛠️ Comandos Customizados

- `:CopyMatches <padrão>` - Copia todas as linhas que correspondem ao padrão
- `:CopyPath` - Abre Telescope para buscar arquivo e copiar seu path relativo
- `:Datetime` - Insere data/hora atual e abre nova linha
- `:ObsidianDaily` - Abre ou cria nota diária do Obsidian
- `:Today` - Alias para `:ObsidianDaily`

## 🔄 Visual Block Mode Nativo

Para edição em bloco sem plugins:
- `<Ctrl-Q>` - Entrar no Visual Block mode (Windows)
- `j/k` - Selecionar múltiplas linhas
- `<Shift-I>` - Inserir no início das linhas selecionadas
- `<Esc><Esc>` - Aplicar em todas as linhas

## 🚀 Instalação

1. Clone este repositório:
```bash
git clone <seu-repo> ~/AppData/Local/nvim  # Windows
```

2. Abra o Neovim:
```bash
nvim
```

3. Os plugins serão instalados automaticamente pelo lazy.nvim

## 📝 Personalização

- **Opções**: Edite `lua/config/options.lua`
- **Atalhos**: Edite `lua/config/keymaps.lua`
- **Comandos**: Edite `lua/config/commands.lua`
- **Plugins**: Adicione novos arquivos em `lua/plugins/`

## 🔗 CLI Tools Integradas

Este setup está preparado para integração com:
- **bat** - Cat com syntax highlighting
- **fzf** - Fuzzy finder
- **ripgrep (rg)** - Busca rápida de texto
- **yazi** - File manager
- **lazygit** - Interface Git
- **tree-sitter** - Parsing de código

## 🐛 Troubleshooting

Se algo não funcionar após atualizar:
1. Remova o cache: `:Lazy clean`
2. Reinstale plugins: `:Lazy sync`
3. Reinicie o Neovim

## 📄 Licença

Configuração pessoal - use como referência!
