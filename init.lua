require('plugins-init')
require('keymaps')
require("mason").setup()
require('completion')
require('lsp')

-- GUI
vim.opt.title = true
vim.opt.ruler = false
vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.encoding = 'utf-8'
vim.opt.relativenumber = true

-- tabs and indents
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Misc
vim.opt.compatible = false
vim.cmd("filetype plugin on")
vim.opt.syntax = True

-- Cosmetic
vim.opt.termguicolors = true
vim.cmd("colorscheme catppuccin-macchiato")
vim.g.airline_theme = 'catppuccin'

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#8bd5ca gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#67d0e2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#62c7fa gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#8cb7ff gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#c6a0f6 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#8cb7ff gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent7 guifg=#62c7fa gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent8 guifg=#67d0e2 gui=nocombine]]

require("indent_blankline").setup {
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
		"IndentBlanklineIndent7",
		"IndentBlanklineIndent8",
	},
}

-- TreeSitter highlights
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}

-- LSP Diagnostic Icons
local signs = {
    Error = "",
    Warn = "",
    Hint = "",
    Info = ""
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

-- Wilder
local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

wilder.set_option('pipeline', {
	wilder.branch(
		wilder.cmdline_pipeline({
			fuzzy = 1,
			set_pcre2_pattern = 1,
		})
	),
})

wilder.setup {
	next_key = "<C-j>",
	accept_key = "<C-l>",
	reject_key = "<C-h>",
	previous_key = "<C-k>",
	modes = { ":", "/", "?" },
}

wilder.set_option(
"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
		border = "rounded",
		highlights = { border = "Normal" },
		highlighter = wilder.basic_highlighter(),
		left = { " ", wilder.popupmenu_devicons() },
	})
)

-- Ignore case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- VimWiki
vim.g.vimwiki_list = {{path = '~/OneDrive/notes/vimwiki'}}

-- VimTex
vim.g.vimtex_view_method = "zathura"

-- Autocommand Definitions (just to be tidy.)
local augroup = vim.api.nvim_create_augroup		-- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd		-- Create autocommand

-- Use system clipboard as default yank/paste buffer
vim.opt.clipboard = "unnamedplus"
-- Remove trailing whitespace and retab on save
autocmd('BufWritePre', {pattern = '', command = ":%s/\\s\\+$//e"})
-- Disable autocomment on new line
autocmd('FileType', {pattern = '', command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"})
-- Clear tex build files when vim closes
autocmd('VimLeave', {pattern = '*.tex', command = "!texclear %"})
-- Toggle insert mode when switching to terminal buffer
autocmd('TermOpen', {pattern = '', command = 'startinsert'})
autocmd('BufWinEnter', {pattern = 'term://*', command = 'startinsert'})
autocmd({'WinEnter', 'BufLeave'}, {pattern = 'term://*', command = 'startinsert'})
-- NERDTree Auto close
autocmd('bufenter', {pattern = '', command = 'if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif'})
-- Reload xorg after saving configs
autocmd({'BufRead','BufNewFile'}, {pattern = {'Xresources','Xdefaults','xresources','xdefaults'}, command = 'set filetype=xdefaults'})
autocmd('BufWritePost', {pattern = {'Xresources','Xdefaults','xresources','xdefaults'}, command = '!xrdb %'})
