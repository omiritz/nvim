vim.env.PATH = "C:\\TEMP\\tree-sitter;" .. vim.env.PATH
vim.env.CC = "gcc"

local parsers = { "lua", "vim", "vimdoc", "python", "javascript", "html", "css", "json", "markdown" }

for _, lang in ipairs(parsers) do
    vim.cmd("TSInstall! " .. lang)
end
