# Plugins Essenciais - Guia Rápido

## 📦 Plugins Instalados

### 1. Treesitter
**Descrição:** Syntax highlighting inteligente baseado em AST  
**Arquivo:** `lua/plugins/treesitter.lua`

**Funcionalidades:**
- ✅ Syntax highlighting muito melhor que regex
- ✅ Indentação inteligente
- ✅ Seleção incremental com Ctrl+Space

**Atalhos:**
- `<C-space>` - Expandir seleção (modo visual)
- `<C-backspace>` - Reduzir seleção (modo visual)

**Linguagens instaladas:**
- lua, vim, markdown, python, javascript, typescript
- html, css, json, yaml, bash, go, rust

**Comandos úteis:**
```vim
:TSInstall <linguagem>     " Instalar parser
:TSUpdate                  " Atualizar parsers
:TSModuleInfo              " Ver módulos ativos
```

---

### 2. Lualine
**Descrição:** Statusline bonita e informativa  
**Arquivo:** `lua/plugins/lualine.lua`

**O que mostra:**
- Modo atual (NORMAL, INSERT, VISUAL)
- Branch git + diff + diagnósticos
- Nome do arquivo (caminho relativo)
- Encoding, formato, tipo de arquivo
- Posição no arquivo

**Aparência:** Minimalista com separadores simples `|`

---

### 3. Comment.nvim
**Descrição:** Comentar/descomentar código facilmente  
**Arquivo:** `lua/plugins/comment.lua`

**Atalhos principais:**

| Tecla | Modo | Descrição |
|-------|------|-----------|
| `gcc` | Normal | Comentar/descomentar linha atual |
| `gc{motion}` | Normal | Comentar com movimento (ex: `gc3j`) |
| `gc` | Visual | Comentar seleção |
| `gbc` | Normal | Comentar bloco |
| `gb` | Visual | Comentar bloco |
| `gcO` | Normal | Adicionar comentário acima |
| `gco` | Normal | Adicionar comentário abaixo |
| `gcA` | Normal | Adicionar comentário no final da linha |

**Exemplos:**
```
gcc       -> comenta a linha atual
gc3j      -> comenta linha atual + 3 abaixo
gcip      -> comenta parágrafo inteiro
```

---

### 4. Telescope FZF Native
**Descrição:** Algoritmo FZF nativo para busca mais rápida no Telescope  
**Arquivo:** `lua/plugins/telescope.lua` (integrado)

**Benefícios:**
- ✅ Busca 10-20x mais rápida
- ✅ Algoritmo fuzzy melhor
- ✅ Usa código nativo compilado (C)

**Uso:** Transparente, funciona automaticamente com Telescope

---

## 🚀 Como usar após instalação

1. **Abra o Neovim**
2. **Aguarde instalação automática** (Lazy.nvim vai baixar os plugins)
3. **Treesitter vai compilar parsers** (pode demorar uns segundos)
4. **Pronto!** Tudo deve funcionar automaticamente

## 🔧 Troubleshooting

### Treesitter não compila
```vim
:checkhealth nvim-treesitter
```
Certifique-se que tem um compilador C instalado (gcc/clang/msvc)

### FZF Native não compila
Requer CMake instalado. No Windows:
```bash
winget install Kitware.CMake
```

### Lualine não aparece
Verifique se `nvim-web-devicons` está instalado:
```vim
:Lazy
```

## 📝 Próximos plugins recomendados

- **which-key** - Mostra atalhos disponíveis
- **gitsigns** - Mostra mudanças git na margem
- **flash.nvim** - Navegação ultra rápida
- **nvim-autopairs** - Auto-fecha parênteses
- **indent-blankline** - Linhas de indentação

---

**Última atualização:** 2025-06-05
