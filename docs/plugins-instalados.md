# Plugins Instalados

Documentação dos plugins ativos no Neovim.

---

## 📦 Lista de Plugins

### 1. **Treesitter**
**Arquivo:** `lua/plugins/treesitter.lua`

Syntax highlighting inteligente baseado em AST (Abstract Syntax Tree).

**Linguagens instaladas:**
- Lua, Vim, Markdown
- Python, Java, Groovy
- JavaScript, TypeScript, HTML, CSS
- JSON, YAML, Bash
- Go, Rust

**Atalhos:**
- `Ctrl+Space` - Expandir seleção incremental
- `Ctrl+Backspace` - Reduzir seleção

---

### 2. **Treesitter Text Objects**
**Integrado em:** `lua/plugins/treesitter.lua`

Seleções e navegação baseadas na estrutura do código.

**Atalhos:**

| Tecla | Descrição |
|-------|-----------|
| `vif` | Selecionar dentro da função |
| `vaf` | Selecionar função inteira |
| `vic` | Selecionar dentro da classe |
| `vac` | Selecionar classe inteira |
| `via` | Selecionar parâmetro |
| `vib` | Selecionar dentro do bloco |
| `vab` | Selecionar bloco inteiro |

**Exemplo:**
```lua
function hello()    -- vaf seleciona tudo isso
    print("world")  -- vif seleciona só esta linha
end
```

---

### 3. **Lualine**
**Arquivo:** `lua/plugins/lualine.lua`

Statusline informativa na parte inferior.

**Mostra:**
- Modo atual (NORMAL, INSERT, VISUAL)
- Branch git + diff + diagnósticos
- Nome do arquivo (caminho relativo)
- Posição no arquivo

---

### 4. **Comment.nvim**
**Arquivo:** `lua/plugins/comment.lua`

Comentar e descomentar código facilmente.

**Atalhos:**

| Tecla | Modo | Descrição |
|-------|------|-----------|
| `gcc` | Normal | Comentar/descomentar linha |
| `gc{motion}` | Normal | Comentar com movimento (ex: `gc3j`) |
| `gc` | Visual | Comentar seleção |
| `gcO` | Normal | Adicionar comentário acima |
| `gco` | Normal | Adicionar comentário abaixo |
| `gcA` | Normal | Adicionar comentário no final da linha |

**Exemplos:**
```
gcc       → comenta linha atual
gc3j      → comenta 3 linhas abaixo
gcip      → comenta parágrafo inteiro
```

---

### 5. **Telescope**
**Arquivo:** `lua/plugins/telescope.lua`

Fuzzy finder para buscar arquivos e conteúdo.

**Atalhos:**

| Tecla | Descrição |
|-------|-----------|
| `<leader>ff` | Buscar arquivos |
| `<leader>fb` | Buscar buffers |
| `<leader>fg` | Buscar texto (live grep) |

**Nota:** `<leader>` = Espaço

---

### 6. **Oil.nvim**
**Arquivo:** `lua/plugins/oil.lua`

Explorador de arquivos (edita diretórios como buffers).

**Atalhos:**

| Tecla | Descrição |
|-------|-----------|
| `<leader>e` | Abrir Oil |
| `<leader>-` | Abrir Oil no diretório atual |
| `gy` | Copiar path absoluto |
| `gY` | Copiar path relativo |

**Dentro do Oil:**
- `Enter` - Abrir arquivo/diretório
- `-` - Subir um nível
- `g.` - Mostrar/ocultar arquivos ocultos

---

### 7. **Obsidian Daily**
**Arquivo:** `lua/plugins/obsidian-daily.lua`

Gerenciamento de notas diárias do Obsidian.

**Atalhos:**

| Tecla | Descrição |
|-------|-----------|
| `<leader>ot` | Abrir nota de hoje |
| `<leader>on` | Próxima nota |
| `<leader>op` | Nota anterior |
| `<leader>of` | Buscar notas |
| `<leader>og` | Buscar conteúdo nas notas |

---

## 🎨 Tema

**wildcharm** - Tema de cores atual

---

## 🔧 Configurações

### Arquivos principais:
- `init.lua` - Entrada principal
- `lua/config/options.lua` - Opções do Vim
- `lua/config/keymaps.lua` - Atalhos de teclado
- `lua/config/commands.lua` - Comandos customizados
- `lua/plugins/*.lua` - Configuração de plugins

### Diretórios:
- `~/.local/share/nvim-data/lazy/` - Plugins instalados
- `~/.local/share/nvim-data/site/parser/` - Parsers compilados do Treesitter

---

## 📚 Comandos úteis

### Treesitter:
```vim
:TSInstall <linguagem>    " Instalar parser
:TSUpdate                 " Atualizar parsers
```

### Lazy (gerenciador de plugins):
```vim
:Lazy                     " Abrir interface
:Lazy sync                " Sincronizar plugins
:Lazy update              " Atualizar plugins
```

### Geral:
```vim
:checkhealth              " Verificar saúde do Neovim
:messages                 " Ver mensagens de log
```

---

## 🚀 Atalhos gerais do Neovim

| Tecla | Descrição |
|-------|-----------|
| `<leader>w` | Salvar arquivo |
| `<leader>q` | Fechar janela |
| `<leader>cp` | Copiar path absoluto |
| `<leader>cl` | Copiar arquivo + linha |
| `Tab` | Próximo buffer |
| `Shift+Tab` | Buffer anterior |
| `<leader>bd` | Fechar buffer |

---

**Última atualização:** 2025-06-05
