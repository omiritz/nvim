# Configuração do Neovim

Configuração pessoal do Neovim focada em desenvolvimento com **Python**, **Groovy**, **Java**, **Node.js**, **Docker** e documentação em **Markdown**.

## 📁 Estrutura

```
nvim/
├── init.lua                    # Entrada principal
├── lua/
│   ├── config/
│   │   ├── options.lua        # Configurações do Neovim
│   │   ├── keymaps.lua        # Atalhos de teclado
│   │   └── commands.lua       # Comandos customizados
│   └── plugins/
│       └── telescope.lua      # Configuração do Telescope
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

## ⌨️ Atalhos Principais

**Leader Key**: `<Space>`

### Arquivos
- `<leader>w` - Salvar arquivo
- `<leader>q` - Fechar janela
- `<leader>e` - Abrir explorador de arquivos (netrw)

### Busca (Telescope)
- `<leader>ff` - Buscar arquivos
- `<leader>fg` - Buscar texto (grep)
- `<leader>fb` - Listar buffers abertos

### Copiar
- `<leader>cp` - Copiar path absoluto do arquivo atual
- `<leader>cl` - Copiar path + número da linha atual

## 🛠️ Comandos Customizados

- `:CopyMatches <padrão>` - Copia todas as linhas que correspondem ao padrão
- `:CountMatches <padrão>` - Conta ocorrências de um padrão no arquivo

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
