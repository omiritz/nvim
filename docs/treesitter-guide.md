# Guia Completo: Treesitter

## 🎯 O que o Treesitter faz?

Treesitter analisa seu código e cria uma **árvore sintática (AST)**, permitindo entender a estrutura real do código, não apenas padrões de texto.

---

## ✅ Funcionalidades Básicas (já ativas)

### 1. Syntax Highlighting Inteligente
- Cores baseadas no contexto real do código
- Identifica funções, classes, variáveis, etc.
- Muito mais preciso que regex

### 2. Indentação Inteligente
- Auto-indent baseado na estrutura
- Funciona em qualquer linguagem com parser

### 3. Seleção Incremental
| Tecla | Descrição |
|-------|-----------|
| `Ctrl+Space` | Expandir seleção (palavra → expressão → função → classe) |
| `Ctrl+Backspace` | Reduzir seleção |

**Exemplo:**
```lua
function hello()
    local name = "world"
    print("Hello " .. name)
end
```
- Cursor em `name` → `Ctrl+Space` → seleciona `name`
- `Ctrl+Space` novamente → seleciona `local name = "world"`
- Mais uma vez → seleciona a função inteira

---

## 🚀 Plugins Recomendados com Treesitter

### **1. Treesitter Text Objects** ⭐⭐⭐

**Seleções inteligentes:**

| Keymap | Descrição | Exemplo |
|--------|-----------|---------|
| `vif` | Selecionar dentro da função | Corpo da função sem `{}`  |
| `vaf` | Selecionar função inteira | Inclui `function` e `{}` |
| `vic` | Selecionar dentro da classe | Corpo da classe |
| `vac` | Selecionar classe inteira | Inclui declaração |
| `vaa` | Selecionar argumento | Um parâmetro |
| `vib` | Selecionar dentro do bloco | Conteúdo do bloco |

**Navegação entre funções/classes:**

| Keymap | Descrição |
|--------|-----------|
| `]f` | Ir para próxima função |
| `[f` | Ir para função anterior |
| `]c` | Ir para próxima classe |
| `[c` | Ir para classe anterior |
| `]a` | Ir para próximo argumento |
| `[a` | Ir para argumento anterior |

**Trocar argumentos:**

| Keymap | Descrição |
|--------|-----------|
| `<leader>sn` | Trocar argumento com próximo |
| `<leader>sp` | Trocar argumento com anterior |

**Exemplo prático:**
```python
def calculate(x, y, z):
    result = x + y + z
    return result
```
- Cursor em `y` → `<leader>sn` → vira `calculate(x, z, y)`
- `dif` → deleta corpo da função (deixa só `def`)
- `]f` → pula para próxima função

---

### **2. Treesitter Context** ⭐⭐

Mostra a função/classe atual **fixada no topo** quando você scrolla.

**Útil quando:**
- Função longa e você esquece onde está
- Classe grande com vários métodos
- Navegando por arquivo grande

**Keymap:**
| Tecla | Descrição |
|-------|-----------|
| `[x` | Pular cursor para o contexto |

**Visual:**
```
┌─────────────────────────────┐
│ class MyClass:             │  ← Contexto fixo
├─────────────────────────────┤
│     def long_method(self): │
│         ... (linha 50)     │
│         código aqui        │
```

---

### **3. Auto Tag** ⭐

Para HTML/JSX/XML: auto-fecha e renomeia tags.

**Exemplo:**
```html
<div>   → digita </   → auto-completa </div>

<div>conteúdo</div>
```
- Renomeia `div` → automaticamente renomeia `</div>` também
- Fecha tag automaticamente

---

## 📦 Instalação dos plugins extras

Quer instalar os 3 plugins extras? Eu criei os arquivos:

1. `lua/plugins/treesitter-textobjects.lua`
2. `lua/plugins/treesitter-context.lua`
3. `lua/plugins/autotag.lua`

**Para ativar:**
1. Feche o Neovim
2. Reabra
3. Execute `:Lazy sync`

---

## 🛠️ Comandos úteis

| Comando | Descrição |
|---------|-----------|
| `:TSInstall <lang>` | Instalar parser de linguagem |
| `:TSUpdate` | Atualizar todos os parsers |
| `:TSModuleInfo` | Ver módulos ativos |
| `:InspectTree` | Ver AST do arquivo atual |
| `:Inspect` | Ver highlight groups sob cursor |
| `:checkhealth nvim-treesitter` | Verificar saúde do Treesitter |

---

## 💡 Dicas Pro

### Ver a árvore sintática
```vim
:InspectTree
```
Abre janela lateral mostrando a AST em tempo real.

### Debugar highlighting
```vim
:Inspect
```
Mostra qual grupo de highlight está sendo usado sob o cursor.

### Desabilitar em arquivos grandes
Já configurado automaticamente! Desabilita em arquivos > 100KB.

---

## 🎨 Linguagens suportadas

Parsers instalados automaticamente:
- `lua`, `vim`, `vimdoc`, `markdown`
- `python`, `javascript`, `typescript`
- `html`, `css`, `json`, `yaml`
- `bash`, `go`, `rust`

**Adicionar mais:**
```vim
:TSInstall java
:TSInstall cpp
:TSInstall php
```

---

## 🚦 Status

Verificar se está tudo OK:
```vim
:checkhealth nvim-treesitter
```

---

**Última atualização:** 2025-06-05
