# 🔄 Guia de Migração

## O que mudou?

### ✅ Estrutura Anterior
```
nvim/
└── init.lua  (543 linhas, código duplicado)
```

### ✅ Estrutura Nova
```
nvim/
├── init.lua                    # 50 linhas - apenas bootstrap e imports
├── lua/
│   ├── config/
│   │   ├── options.lua        # Todas as configurações do vim.opt
│   │   ├── keymaps.lua        # Todos os atalhos de teclado
│   │   └── commands.lua       # Comandos customizados
│   └── plugins/
│       └── telescope.lua      # Configuração do Telescope
├── .gitignore
└── README.md
```

## 🎯 Benefícios

1. **Sem duplicação**: Removidas ~270 linhas duplicadas
2. **Organização**: Cada arquivo tem uma responsabilidade única
3. **Manutenibilidade**: Fácil encontrar e editar configurações
4. **Escalabilidade**: Adicionar novos plugins é só criar arquivo em `lua/plugins/`
5. **Versionamento**: Repositório Git configurado e pronto

## 📝 Como adicionar novos plugins?

Crie um arquivo em `lua/plugins/` seguindo o padrão:

```lua
-- lua/plugins/meu-plugin.lua
return {
    "autor/nome-do-plugin",
    dependencies = { "dependencia1", "dependencia2" },
    config = function()
        -- Configuração aqui
    end,
}
```

O lazy.nvim vai carregar automaticamente!

## 🔧 Como editar configurações?

| O que quer mudar | Arquivo |
|------------------|---------|
| Opções do Neovim (tabstop, números, etc) | `lua/config/options.lua` |
| Atalhos de teclado | `lua/config/keymaps.lua` |
| Comandos customizados | `lua/config/commands.lua` |
| Configuração de plugin | `lua/plugins/<nome>.lua` |
| Tema/cores | `init.lua` (linha 35-37) |

## 🚀 Próximos passos sugeridos

1. **Adicionar plugins para seu workflow**:
   - LSP para Python, Java, Groovy
   - Autocompletar
   - Treesitter para syntax highlighting
   - Git integration (fugitive ou gitsigns)
   - Markdown preview

2. **Integrar CLI tools**:
   - Telescope com fzf-native
   - Yazi como file manager
   - Lazygit integration

3. **Publicar no GitHub**:
   ```bash
   cd ~/AppData/Local/nvim
   git remote add origin https://github.com/seu-usuario/nvim-config.git
   git push -u origin master
   ```

## ⚙️ Testando a nova configuração

1. Feche e reabra o Neovim
2. Aguarde o lazy.nvim reinstalar os plugins
3. Teste os atalhos: `<space>ff`, `<space>fg`, `<space>e`

Tudo deve funcionar exatamente como antes, mas agora organizado!
