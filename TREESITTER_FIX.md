# Correção do Syntax Highlighting com Treesitter

**Tag:** `treesitter-fix`  
**Data:** 2026-07-21

## Problema

O preview do Oil.nvim exibia syntax highlighting muito melhor do que os arquivos abertos normalmente no editor. As cores e destaque de código ficavam perfeitos no preview, mas ruins no buffer normal.

## Causa Raiz

1. **Treesitter não estava instalado** - O plugin existia mas nenhum parser estava compilado
2. **tree-sitter CLI não estava no PATH** - Necessário para compilar os parsers
3. **Parsers não foram compilados** - Faltava executar a compilação com GCC
4. **Treesitter não era ativado automaticamente** - Precisava de autocmd para iniciar

## Solução Implementada

### 1. Configuração do tree-sitter CLI

**Localização:** `C:\TEMP\tree-sitter\tree-sitter.exe`

Adicionado ao PATH no arquivo `lua/plugins/treesitter.lua`:
```lua
vim.env.PATH = "C:\\TEMP\\tree-sitter;" .. vim.env.PATH
```

### 2. Compilação dos Parsers

**Compilador usado:** GCC (MinGW 15.2.0)

**Parsers instalados:**
- lua
- vim
- vimdoc
- python
- javascript
- html
- css
- json
- yaml
- markdown
- bash
- java
- groovy

**Localização dos parsers compilados:**  
`C:\Users\fernando.konflanz\AppData\Local\nvim-data\site\parser\*.so`

### 3. Configuração do Treesitter

**Arquivo:** `lua/plugins/treesitter.lua`

```lua
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        vim.env.PATH = "C:\\TEMP\\tree-sitter;" .. vim.env.PATH

        require("nvim-treesitter.install").prefer_git = false
        require("nvim-treesitter.install").compilers = { "gcc" }

        -- Força ativação do highlighting
        vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
            callback = function(ev)
                local ft = vim.bo[ev.buf].filetype
                local bt = vim.bo[ev.buf].buftype

                -- Ignora buffers especiais
                if ft == "" or ft == "oil" or ft == "TelescopePrompt" or bt ~= "" then
                    return
                end

                local lang = vim.treesitter.language.get_lang(ft)
                if lang then
                    pcall(vim.treesitter.start, ev.buf, lang)
                end
            end,
        })
    end,
}
```

**Pontos importantes:**
- Autocmd em `BufEnter` e `BufWinEnter` para ativar automaticamente
- Filtro para ignorar buffers especiais (oil, telescope, etc)
- `pcall` para evitar erros em linguagens sem parser

### 4. Ajustes no options.lua

**Arquivo:** `lua/config/options.lua`

```lua
-- Syntax
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")
vim.g.syntax_on = 1
```

Mudança de `syntax on` para `syntax enable` para não sobrescrever o Treesitter.

## Como Instalar Novos Parsers

### Dentro do Neovim:
```vim
:TSInstall <linguagem>
```

### Via script (install-parsers.lua):
```lua
vim.env.PATH = "C:\\TEMP\\tree-sitter;" .. vim.env.PATH
vim.env.CC = "gcc"

local parsers = { "lua", "vim", "python", "javascript" }

for _, lang in ipairs(parsers) do
    vim.cmd("TSInstall! " .. lang)
end
```

Executar: `:source C:\Users\fernando.konflanz\AppData\Local\nvim\install-parsers.lua`

## Verificação

### Verificar parsers instalados:
```bash
ls "$APPDATA/../Local/nvim-data/site/parser/"
```

### Verificar Treesitter ativo em um buffer:
```vim
:lua print(vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] and 'ACTIVE' or 'INACTIVE')
```

### Ativar manualmente (se necessário):
```vim
:TSBufEnable highlight
```

## Resultado

✅ Syntax highlighting agora funciona perfeitamente igual ao preview do Oil  
✅ Cores ricas e detalhadas em todo o código  
✅ Sem erros ao abrir buffers especiais  
✅ Ativação automática para todos os arquivos com parser disponível

## Dependências

- **tree-sitter CLI**: v0.26.8 (`C:\TEMP\tree-sitter\tree-sitter.exe`)
- **GCC**: 15.2.0 (MinGW)
- **Neovim**: v0.13.0-dev
- **nvim-treesitter**: latest (via lazy.nvim)
