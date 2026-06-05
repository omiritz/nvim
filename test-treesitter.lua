-- Teste para verificar se Treesitter carrega

print("=== Testando Treesitter ===")

local ok, ts = pcall(require, "nvim-treesitter")
if ok then
    print("✓ nvim-treesitter carregou")
else
    print("✗ Erro ao carregar nvim-treesitter:", ts)
    return
end

local ok2, config = pcall(require, "nvim-treesitter.config")
if ok2 then
    print("✓ nvim-treesitter.config carregou")
else
    print("✗ Erro ao carregar config:", config)
    return
end

local ok3, textobj = pcall(require, "nvim-treesitter.textobjects")
if ok3 then
    print("✓ nvim-treesitter-textobjects carregou")
else
    print("✗ Erro ao carregar textobjects:", textobj)
end

print("\n=== Parsers disponíveis ===")
local available = require("nvim-treesitter.parsers").available_parsers()
for _, parser in ipairs(available) do
    print("  -", parser)
    if #available > 10 then break end -- só mostrar alguns
end

print("\n=== Teste concluído ===")
