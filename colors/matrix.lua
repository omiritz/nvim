-- ================================
-- Matrix Theme - Custom Colorscheme
-- Baseado no esquema de cores do Windows Terminal
-- ================================

-- Cores do esquema "matrix" do Windows Terminal
local colors = {
    bg = "#000000",
    bg_dim = "#0a1114",
    fg = "#82D967",
    
    -- Cores principais
    black = "#0F191C",
    red = "#23755A",
    green = "#82D967",
    yellow = "#FFD700",
    blue = "#3F5242",
    purple = "#409931",
    cyan = "#50B45A",
    white = "#507350",
    
    -- Cores bright (intensas)
    bright_black = "#688060",
    bright_red = "#2FC079",
    bright_green = "#90D962",
    bright_yellow = "#FAFF00",
    bright_blue = "#4F7E7E",
    bright_purple = "#11FF25",
    bright_cyan = "#C1FF8A",
    bright_white = "#678C61",
    
    -- Cores especiais
    fg_gutter = "#507350",
    selection_bg = "#18282E",
    cursor_bg = "#384545",
    line_nr = "#507350",
    comment = "#507350",
    vertical_sep = "#2a3f34",
    
    -- Cores de sintaxe
    syntax_string = "#426644",
    syntax_keyword = "#23755A",
    syntax_function = "#50B45A",
    syntax_variable = "#426644",
    syntax_number = "#FFD700",
    syntax_operator = "#409931",
    syntax_type = "#3F5242",
    syntax_constant = "#678C61",
    syntax_preproc = "#11FF25",
    syntax_attribute = "#90D762",
    syntax_property = "#50B45A",
}

-- Função para aplicar os highlight groups
local function set_hl(group, opts)
    if opts.bg then opts.bg = colors[opts.bg] or opts.bg end
    if opts.fg then opts.fg = colors[opts.fg] or opts.fg end
    if opts.sp then opts.sp = colors[opts.sp] or opts.sp end
    vim.api.nvim_set_hl(0, group, opts)
end

-- Configuração base (Dark mode)
vim.opt.background = "dark"
vim.g.colors_name = "matrix"

-- Limpar highlights existentes
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

-- Highlight groups principais
set_hl("Normal", { fg = "fg", bg = "bg" })
set_hl("NormalFloat", { fg = "fg", bg = "bg_dim" })
set_hl("FloatBorder", { fg = "fg", bg = "bg_dim" })

-- Cursor e seleção
set_hl("Cursor", { fg = "bg", bg = "bright_green" })
set_hl("CursorLine", { bg = "selection_bg" })
set_hl("CursorLineNr", { fg = "bright_yellow", bg = "selection_bg" })
set_hl("Visual", { bg = "selection_bg" })
set_hl("VisualNOS", { bg = "selection_bg", fg = "bright_red" })

-- Linhas e gutters
set_hl("LineNr", { fg = "line_nr" })
set_hl("FoldColumn", { fg = "line_nr" })
set_hl("SignColumn", { fg = "line_nr", bg = "bg" })
set_hl("Gutter", { fg = "fg_gutter", bg = "bg" })

-- Menus e popups
set_hl("Pmenu", { fg = "fg", bg = "bg_dim" })
set_hl("PmenuSel", { fg = "bg", bg = "green" })
set_hl("PmenuSbar", { bg = "selection_bg" })
set_hl("PmenuThumb", { bg = "fg_gutter" })

-- Barras de scroll
set_hl("Scrollbar", { fg = "fg_gutter", bg = "bg" })
set_hl("ScrollbarHandle", { fg = "green", bg = "selection_bg" })

-- Match Parens
set_hl("MatchParen", { fg = "bright_yellow", bg = "selection_bg", bold = true })

-- Comentários
set_hl("Comment", { fg = "comment", italic = true })
set_hl("Todo", { fg = "bright_yellow", bg = "selection_bg", bold = true })
set_hl("qftodo", { fg = "bright_yellow" })

-- Cores de sintaxe
set_hl("String", { fg = "syntax_string" })
set_hl("Character", { fg = "syntax_string" })
set_hl("Number", { fg = "syntax_number" })
set_hl("Boolean", { fg = "syntax_number" })
set_hl("Float", { fg = "syntax_number" })

set_hl("Keyword", { fg = "syntax_keyword", bold = true })
set_hl("Conditional", { fg = "syntax_keyword" })
set_hl("Repeat", { fg = "syntax_keyword" })
set_hl("Operator", { fg = "syntax_operator" })
set_hl("Label", { fg = "syntax_keyword" })

set_hl("Identifier", { fg = "syntax_variable" })
set_hl("Function", { fg = "syntax_function", bold = true })
set_hl("Method", { fg = "syntax_function" })

set_hl("Type", { fg = "syntax_type", bold = true })
set_hl("StorageClass", { fg = "syntax_type" })
set_hl("Structure", { fg = "syntax_type" })
set_hl("Typedef", { fg = "syntax_type" })

set_hl("Constant", { fg = "syntax_constant", bold = true })
set_hl("Macro", { fg = "syntax_constant" })
set_hl("PreProc", { fg = "syntax_preproc" })
set_hl("Attribute", { fg = "syntax_attribute" })
set_hl("Property", { fg = "syntax_property" })

set_hl("Special", { fg = "bright_purple" })
set_hl("SpecialChar", { fg = "bright_cyan" })
set_hl("Tag", { fg = "bright_green" })
set_hl("Delimiter", { fg = "fg_gutter" })
set_hl("Bracket", { fg = "fg_gutter" })
set_hl("SpecialComment", { fg = "bright_yellow" })

-- Neovim internals
set_hl("Error", { fg = "bright_red", bg = "selection_bg" })
set_hl("ErrorMsg", { fg = "bright_red", bg = "bg", bold = true })
set_hl("WarningMsg", { fg = "bright_yellow", bg = "bg" })
set_hl("MoreMsg", { fg = "green" })
set_hl("ModeMsg", { fg = "fg" })
set_hl("Question", { fg = "bright_green", bold = true })

-- Titulos
set_hl("Title", { fg = "bright_yellow", bold = true })
set_hl("Directory", { fg = "bright_cyan" })

-- Neovim Treesitter (Highlighting)
set_hl("@string", { fg = "syntax_string" })
set_hl("@string.regex", { fg = "syntax_string" })
set_hl("@string.escape", { fg = "bright_cyan" })

set_hl("@keyword", { fg = "syntax_keyword", bold = true })
set_hl("@keyword.operator", { fg = "syntax_operator" })
set_hl("@keyword.function", { fg = "syntax_keyword" })

set_hl("@function", { fg = "syntax_function", bold = true })
set_hl("@function.call", { fg = "syntax_function" })
set_hl("@function.method", { fg = "syntax_function" })

set_hl("@variable", { fg = "syntax_variable" })
set_hl("@variable.builtin", { fg = "bright_purple" })

set_hl("@number", { fg = "syntax_number" })
set_hl("@boolean", { fg = "syntax_number" })

set_hl("@type", { fg = "syntax_type", bold = true })
set_hl("@type.builtin", { fg = "syntax_type" })

set_hl("@property", { fg = "syntax_property" })
set_hl("@field", { fg = "syntax_property" })

set_hl("@comment", { fg = "comment", italic = true })
set_hl("@comment.todo", { fg = "bright_yellow", bold = true })
set_hl("@note", { fg = "bright_cyan" })

set_hl("@constant", { fg = "syntax_constant", bold = true })
set_hl("@constant.builtin", { fg = "bright_purple" })

set_hl("@punctuation", { fg = "fg_gutter" })
set_hl("@operator", { fg = "syntax_operator" })

set_hl("@tag", { fg = "bright_green" })
set_hl("@tag.delimiter", { fg = "fg_gutter" })
set_hl("@attribute", { fg = "syntax_attribute" })

-- Markdown
set_hl("markdownHeadingDelimiter", { fg = "bright_yellow", bold = true })
set_hl("markdownCode", { fg = "fg", bg = "bg_dim" })
set_hl("markdownCodeBlock", { fg = "fg", bg = "bg_dim" })
set_hl("markdownLink", { fg = "bright_cyan", underline = true })
set_hl("markdownUrl", { fg = "bright_cyan", underline = true })
set_hl("markdownBold", { fg = "fg", bold = true })
set_hl("markdownItalic", { fg = "fg", italic = true })

-- LSP Semantic Tokens (Neovim 0.9+)
set_hl("@lsp.type.string", { fg = "syntax_string" })
set_hl("@lsp.type.keyword", { fg = "syntax_keyword" })
set_hl("@lsp.type.function", { fg = "syntax_function" })
set_hl("@lsp.type.variable", { fg = "syntax_variable" })
set_hl("@lsp.type.number", { fg = "syntax_number" })
set_hl("@lsp.type.type", { fg = "syntax_type" })
set_hl("@lsp.type.class", { fg = "syntax_type" })
set_hl("@lsp.type.property", { fg = "syntax_property" })
set_hl("@lsp.type.comment", { fg = "comment", italic = true })

-- Diagnostic
set_hl("DiagnosticError", { fg = "bright_red" })
set_hl("DiagnosticWarn", { fg = "bright_yellow" })
set_hl("DiagnosticHint", { fg = "bright_cyan" })
set_hl("DiagnosticInfo", { fg = "cyan" })

set_hl("DiagnosticUnderlineError", { sp = "bright_red", undercurl = true })
set_hl("DiagnosticUnderlineWarn", { sp = "bright_yellow", undercurl = true })
set_hl("DiagnosticUnderlineHint", { sp = "bright_cyan", undercurl = true })
set_hl("DiagnosticUnderlineInfo", { sp = "cyan", undercurl = true })

-- LSP
set_hl("LspReferenceText", { bg = "selection_bg", sp = "bright_cyan", underline = true })
set_hl("LspReferenceRead", { bg = "selection_bg", sp = "bright_green", underline = true })
set_hl("LspReferenceWrite", { bg = "selection_bg", sp = "bright_yellow", underline = true })

-- Statusline
set_hl("StatusLine", { fg = "fg", bg = "selection_bg" })
set_hl("StatusLineNC", { fg = "fg_gutter", bg = "selection_bg" })
set_hl("StatusLineGit", { fg = "bright_cyan", bg = "selection_bg" })
set_hl("StatusLineGitAdd", { fg = "bright_green", bg = "selection_bg" })
set_hl("StatusLineGitChange", { fg = "bright_yellow", bg = "selection_bg" })
set_hl("StatusLineGitDelete", { fg = "bright_red", bg = "selection_bg" })

-- Tabline
set_hl("TabLine", { fg = "fg_gutter", bg = "bg" })
set_hl("TabLineFill", { fg = "fg_gutter", bg = "bg" })
set_hl("TabLineSel", { fg = "fg", bg = "bg_dim", bold = true })

-- Winbar
set_hl("WinBar", { fg = "fg_gutter", bg = "bg" })
set_hl("WinBarNC", { fg = "fg_gutter", bg = "bg_dim" })

-- Whichkey
set_hl("WhichKey", { fg = "bright_purple" })
set_hl("WhichKeyGroup", { fg = "bright_cyan" })
set_hl("WhichKeyDesc", { fg = "bright_yellow" })
set_hl("WhichKeyFloat", { fg = "fg", bg = "bg_dim" })

-- Telescope
set_hl("TelescopeNormal", { fg = "fg", bg = "bg_dim" })
set_hl("TelescopeBorder", { fg = "fg_gutter", bg = "bg_dim" })
set_hl("TelescopePromptNormal", { fg = "fg", bg = "bg_dim" })
set_hl("TelescopePromptBorder", { fg = "bright_green", bg = "bg_dim" })
set_hl("TelescopePromptTitle", { fg = "bright_yellow", bg = "bg_dim" })
set_hl("TelescopePreviewTitle", { fg = "bright_cyan", bg = "bg_dim" })
set_hl("TelescopeResultsTitle", { fg = "bright_green", bg = "bg_dim" })
set_hl("TelescopeSelection", { fg = "bg", bg = "green" })

-- Oil
set_hl("OilDir", { fg = "bright_cyan" })
set_hl("OilFile", { fg = "fg" })
set_hl("OilLink", { fg = "bright_cyan", underline = true })
set_hl("OilSocket", { fg = "bright_purple" })
set_hl("OilSpecial", { fg = "bright_yellow" })

-- Twilight
set_hl("Twilight", { fg = "fg_gutter", bg = "bg" })
set_hl("TwilightDim", { fg = "fg_gutter", bg = "bg" })
set_hl("TwilightNormal", { fg = "fg", bg = "bg" })
set_hl("TwilightFloat", { fg = "fg", bg = "bg_dim" })
set_hl("TwilightBorder", { fg = "fg_gutter", bg = "bg_dim" })

-- Notify (nvim-notify)
set_hl("NotifyINFO", { fg = "cyan" })
set_hl("NotifyWARN", { fg = "bright_yellow" })
set_hl("NotifyERROR", { fg = "bright_red" })
set_hl("NotifyDEBUG", { fg = "fg_gutter" })
set_hl("NotifyTRACE", { fg = "bright_purple" })

-- Misc
set_hl("NonText", { fg = "fg_gutter" })
set_hl("EndOfBuffer", { fg = "bg" })
set_hl("TermCursor", { fg = "bg", bg = "bright_green" })
set_hl("TermCursorNC", { fg = "fg", bg = "selection_bg" })
set_hl("WildMenu", { fg = "bg", bg = "green" })
set_hl("QuickFixLine", { fg = "bg", bg = "bright_yellow", bold = true })

-- Vim help
set_hl("helpHeader", { fg = "bright_yellow", bold = true })
set_hl("helpURL", { fg = "bright_cyan", underline = true })
set_hl("helpCommand", { fg = "fg" })

-- Git signs
set_hl("GitSignsAdd", { fg = "bright_green" })
set_hl("GitSignsChange", { fg = "bright_yellow" })
set_hl("GitSignsDelete", { fg = "bright_red" })
set_hl("GitSignsAddNr", { fg = "bright_green" })
set_hl("GitSignsChangeNr", { fg = "bright_yellow" })
set_hl("GitSignsDeleteNr", { fg = "bright_red" })

-- Diff
set_hl("DiffAdd", { fg = "bright_green", bg = "bg_dim" })
set_hl("DiffChange", { fg = "bright_yellow", bg = "bg_dim" })
set_hl("DiffDelete", { fg = "bright_red", bg = "bg_dim" })
set_hl("DiffText", { fg = "bright_cyan", bg = "selection_bg" })

-- Search
set_hl("Search", { fg = "bg", bg = "bright_yellow" })
set_hl("IncSearch", { fg = "bg", bg = "bright_purple" })
set_hl("CurSearch", { fg = "bg", bg = "bright_cyan" })

-- Spell
set_hl("SpellBad", { sp = "bright_red", undercurl = true })
set_hl("SpellCap", { sp = "bright_yellow", undercurl = true })
set_hl("SpellLocal", { sp = "bright_cyan", undercurl = true })
set_hl("SpellRare", { sp = "bright_purple", undercurl = true })
