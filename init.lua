local opt = vim.opt

-- =========================================================
-- OPTIONS
-- =========================================================

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.statuscolumn = ""
opt.laststatus = 2
opt.statusline = " %t %m %= %l:%c | %P "
opt.cmdheight = 1

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- find
opt.path = "**"
opt.wildmenu = true
opt.wildmode = "full"

-- files
opt.backup = false
opt.writebackup = false
opt.swapfile = false

opt.clipboard = "unnamedplus"
opt.updatetime = 250
opt.timeoutlen = 500

opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 8

opt.foldmethod = "indent"
opt.foldenable = false
opt.foldlevel = 99

-- =========================================================
-- NETRW
-- =========================================================

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25

-- =========================================================
-- VIM
-- =========================================================

vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

vim.g.mapleader = " "

-- =========================================================
-- MATRIX COLORSCHEME
-- =========================================================

opt.termguicolors = true
opt.background = "dark"

local colors = {
  bg = "#000000",
  bg_dim = "#0a1114",
  fg = "#82D967",

  black = "#0F191C",
  red = "#23755A",
  green = "#82D967",
  yellow = "#FFD700",
  blue = "#3F5242",
  purple = "#409931",
  cyan = "#50B45A",
  white = "#507350",

  bright_black = "#688060",
  bright_red = "#2FC079",
  bright_green = "#90D962",
  bright_yellow = "#FAFF00",
  bright_blue = "#4F7E7E",
  bright_purple = "#11FF25",
  bright_cyan = "#C1FF8A",
  bright_white = "#678C61",

  fg_gutter = "#507350",
  selection_bg = "#18282E",
  cursor_bg = "#384545",
  line_nr = "#507350",
  comment = "#507350",
  vertical_sep = "#2a3f34",

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

-- highlight helper
local function set_hl(group, settings)
  local opts = vim.deepcopy(settings)

  for _, key in ipairs({ "fg", "bg", "sp" }) do
    if opts[key] then
      opts[key] = colors[opts[key]] or opts[key]
    end
  end

  vim.api.nvim_set_hl(0, group, opts)
end

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "matrix"

-- =========================================================
-- GENERAL HIGHLIGHTS
-- =========================================================

local highlights = {
  -- base
  Normal = { fg = "fg", bg = "bg" },
  NormalFloat = { fg = "fg", bg = "bg_dim" },
  FloatBorder = { fg = "fg", bg = "bg_dim" },

  -- cursor and selection
  Cursor = { fg = "bg", bg = "bright_green" },
  CursorLine = { bg = "selection_bg" },
  CursorLineNr = { fg = "bright_yellow", bg = "selection_bg" },
  Visual = { bg = "selection_bg" },
  VisualNOS = { bg = "selection_bg", fg = "bright_red" },
  MatchParen = { fg = "bright_yellow", bg = "selection_bg", bold = true },

  -- gutter
  LineNr = { fg = "line_nr" },
  FoldColumn = { fg = "line_nr" },
  SignColumn = { fg = "line_nr", bg = "bg" },
  Gutter = { fg = "fg_gutter", bg = "bg" },

  -- menus
  Pmenu = { fg = "fg", bg = "bg_dim" },
  PmenuSel = { fg = "bg", bg = "green" },
  PmenuSbar = { bg = "selection_bg" },
  PmenuThumb = { bg = "fg_gutter" },

  -- comments
  Comment = { fg = "comment", italic = true },
  Todo = { fg = "bright_yellow", bg = "selection_bg", bold = true },

  -- syntax
  String = { fg = "syntax_string" },
  Character = { fg = "syntax_string" },
  Number = { fg = "syntax_number" },
  Boolean = { fg = "syntax_number" },
  Float = { fg = "syntax_number" },

  Keyword = { fg = "syntax_keyword", bold = true },
  Conditional = { fg = "syntax_keyword" },
  Repeat = { fg = "syntax_keyword" },
  Label = { fg = "syntax_keyword" },

  Operator = { fg = "syntax_operator" },
  Identifier = { fg = "syntax_variable" },
  Function = { fg = "syntax_function", bold = true },
  Method = { fg = "syntax_function" },

  Type = { fg = "syntax_type", bold = true },
  StorageClass = { fg = "syntax_type" },
  Structure = { fg = "syntax_type" },
  Typedef = { fg = "syntax_type" },

  Constant = { fg = "syntax_constant", bold = true },
  Macro = { fg = "syntax_constant" },
  PreProc = { fg = "syntax_preproc" },
  Attribute = { fg = "syntax_attribute" },
  Property = { fg = "syntax_property" },

  Special = { fg = "bright_purple" },
  SpecialChar = { fg = "bright_cyan" },
  Tag = { fg = "bright_green" },
  Delimiter = { fg = "fg_gutter" },
  Bracket = { fg = "fg_gutter" },
  SpecialComment = { fg = "bright_yellow" },

  -- messages
  Error = { fg = "bright_red", bg = "selection_bg" },
  ErrorMsg = { fg = "bright_red", bg = "bg", bold = true },
  WarningMsg = { fg = "bright_yellow", bg = "bg" },
  MoreMsg = { fg = "green" },
  ModeMsg = { fg = "fg" },
  Question = { fg = "bright_green", bold = true },
  Title = { fg = "bright_yellow", bold = true },
  Directory = { fg = "bright_cyan" },

  -- statusline
  StatusLine = { fg = "fg", bg = "selection_bg" },
  StatusLineNC = { fg = "fg_gutter", bg = "selection_bg" },

  -- tabs
  TabLine = { fg = "fg_gutter", bg = "bg" },
  TabLineFill = { fg = "fg_gutter", bg = "bg" },
  TabLineSel = { fg = "fg", bg = "bg_dim", bold = true },

  -- winbar
  WinBar = { fg = "fg_gutter", bg = "bg" },
  WinBarNC = { fg = "fg_gutter", bg = "bg_dim" },

  -- misc
  NonText = { fg = "fg_gutter" },
  EndOfBuffer = { fg = "bg" },
  TermCursor = { fg = "bg", bg = "bright_green" },
  TermCursorNC = { fg = "fg", bg = "selection_bg" },
  WildMenu = { fg = "bg", bg = "green" },
  QuickFixLine = { fg = "bg", bg = "bright_yellow", bold = true },

  -- search
  Search = { fg = "bg", bg = "bright_yellow" },
  IncSearch = { fg = "bg", bg = "bright_purple" },
  CurSearch = { fg = "bg", bg = "bright_cyan" },

  -- diff
  DiffAdd = { fg = "bright_green", bg = "bg_dim" },
  DiffChange = { fg = "bright_yellow", bg = "bg_dim" },
  DiffDelete = { fg = "bright_red", bg = "bg_dim" },
  DiffText = { fg = "bright_cyan", bg = "selection_bg" },

  -- spell
  SpellBad = { sp = "bright_red", undercurl = true },
  SpellCap = { sp = "bright_yellow", undercurl = true },
  SpellLocal = { sp = "bright_cyan", undercurl = true },
  SpellRare = { sp = "bright_purple", undercurl = true },
}

for group, settings in pairs(highlights) do
  set_hl(group, settings)
end

-- =========================================================
-- TREESITTER HIGHLIGHTS
-- =========================================================

local treesitter = {
  ["@string"] = { fg = "syntax_string" },
  ["@string.regex"] = { fg = "syntax_string" },
  ["@string.escape"] = { fg = "bright_cyan" },

  ["@keyword"] = { fg = "syntax_keyword", bold = true },
  ["@keyword.operator"] = { fg = "syntax_operator" },
  ["@keyword.function"] = { fg = "syntax_keyword" },

  ["@function"] = { fg = "syntax_function", bold = true },
  ["@function.call"] = { fg = "syntax_function" },
  ["@function.method"] = { fg = "syntax_function" },

  ["@variable"] = { fg = "syntax_variable" },
  ["@variable.builtin"] = { fg = "bright_purple" },

  ["@number"] = { fg = "syntax_number" },
  ["@boolean"] = { fg = "syntax_number" },

  ["@type"] = { fg = "syntax_type", bold = true },
  ["@type.builtin"] = { fg = "syntax_type" },

  ["@property"] = { fg = "syntax_property" },
  ["@field"] = { fg = "syntax_property" },

  ["@comment"] = { fg = "comment", italic = true },
  ["@comment.todo"] = { fg = "bright_yellow", bold = true },
  ["@note"] = { fg = "bright_cyan" },

  ["@constant"] = { fg = "syntax_constant", bold = true },
  ["@constant.builtin"] = { fg = "bright_purple" },

  ["@punctuation"] = { fg = "fg_gutter" },
  ["@operator"] = { fg = "syntax_operator" },

  ["@tag"] = { fg = "bright_green" },
  ["@tag.delimiter"] = { fg = "fg_gutter" },
  ["@attribute"] = { fg = "syntax_attribute" },
}

for group, settings in pairs(treesitter) do
  set_hl(group, settings)
end

-- =========================================================
-- MARKDOWN HIGHLIGHTS
-- =========================================================

local markdown = {
  markdownHeadingDelimiter = { fg = "bright_yellow", bold = true },
  markdownCode = { fg = "fg", bg = "bg_dim" },
  markdownCodeBlock = { fg = "fg", bg = "bg_dim" },
  markdownLink = { fg = "bright_cyan", underline = true },
  markdownUrl = { fg = "bright_cyan", underline = true },
  markdownBold = { fg = "fg", bold = true },
  markdownItalic = { fg = "fg", italic = true },
}

for group, settings in pairs(markdown) do
  set_hl(group, settings)
end

-- =========================================================
-- LSP HIGHLIGHTS
-- =========================================================

local lsp = {
  ["@lsp.type.string"] = { fg = "syntax_string" },
  ["@lsp.type.keyword"] = { fg = "syntax_keyword" },
  ["@lsp.type.function"] = { fg = "syntax_function" },
  ["@lsp.type.variable"] = { fg = "syntax_variable" },
  ["@lsp.type.number"] = { fg = "syntax_number" },
  ["@lsp.type.type"] = { fg = "syntax_type" },
  ["@lsp.type.class"] = { fg = "syntax_type" },
  ["@lsp.type.property"] = { fg = "syntax_property" },
  ["@lsp.type.comment"] = { fg = "comment", italic = true },

  DiagnosticError = { fg = "bright_red" },
  DiagnosticWarn = { fg = "bright_yellow" },
  DiagnosticHint = { fg = "bright_cyan" },
  DiagnosticInfo = { fg = "cyan" },

  DiagnosticUnderlineError = { sp = "bright_red", undercurl = true },
  DiagnosticUnderlineWarn = { sp = "bright_yellow", undercurl = true },
  DiagnosticUnderlineHint = { sp = "bright_cyan", undercurl = true },
  DiagnosticUnderlineInfo = { sp = "cyan", undercurl = true },

  LspReferenceText = {
    bg = "selection_bg",
    sp = "bright_cyan",
    underline = true,
  },

  LspReferenceRead = {
    bg = "selection_bg",
    sp = "bright_green",
    underline = true,
  },

  LspReferenceWrite = {
    bg = "selection_bg",
    sp = "bright_yellow",
    underline = true,
  },
}

for group, settings in pairs(lsp) do
  set_hl(group, settings)
end

-- =========================================================
-- KEYMAPS
-- =========================================================

local keymap = vim.keymap.set

keymap("n", "<leader>w", "<cmd>w<CR>")
keymap("n", "<leader>q", "<cmd>q<CR>")
keymap("n", "<leader>e", "<cmd>Explore<CR>")

-- buffers
keymap("n", "<Tab>", "<cmd>bnext<CR>")
keymap("n", "<S-Tab>", "<cmd>bprevious<CR>")

-- paths
keymap("n", "<leader>cp", function()
  local file = vim.fn.expand("%:p")
  vim.fn.setreg("+", file)
  print(file)
end)

keymap("n", "<leader>cl", function()
  local text = string.format(
    "%s:%d",
    vim.fn.expand("%:p"),
    vim.fn.line(".")
  )

  vim.fn.setreg("+", text)
  print(text)
end)

-- =========================================================
-- USER COMMANDS
-- =========================================================

vim.api.nvim_create_user_command("Datetime", function()
  local datetime = os.date("%Y-%m-%d %H:%M:%S")
  vim.api.nvim_put({ datetime }, "c", true, true)
end, {})
