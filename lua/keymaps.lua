--[[

  _  __
 | |/ /
 | ' / ___ _   _ _ __ ___	__ _ _ __  ___
 |	< / _ \ | | | '_ ` _ \ / _` | '_ \/ __|
 | . \	__/ |_| | | | | | | (_| | |_) \__ \
 |_|\_\___|\__, |_| |_| |_|\__,_| .__/|___/
			__/ |				| |
		   |___/				|_|
--]]

-- General
vim.g.mapleader = ','	-- ',' as leader
vim.g.maplocalleader = ','
vim.keymap.set('v', '.', ':normal .<CR>')	-- Dot commands work in visual mode
vim.keymap.set('n', 'S', ':%s//g<Left><Left>')	-- 'Shift+S' to replace all
vim.keymap.set('n', '<leader>v', ':VimwikiIndex<CR>')	-- leader+v to open Nvim Wiki

-- Terminal
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]])	-- Shortcut term escape
vim.keymap.set('t','<C-h>', [[<C-\><C-n><C-w>h<ESC>]])	-- Easy escape and split nav for terminal
vim.keymap.set('t','<C-j>', [[<C-\><C-n><C-w>j<ESC>]])
vim.keymap.set('t','<C-k>', [[<C-\><C-n><C-w>k<ESC>]])
vim.keymap.set('t','<C-l>', [[<C-\><C-n><C-w>l<ESC>]])

-- Nerd Tree
vim.keymap.set({'v','n','i'}, '<leader>n', ':NERDTreeToggle<CR>')	-- Toggle NERDTree
vim.g.NERDTreeMapActivateNode = "l" -- Open selected node
vim.g.NERDTreeMapJumpParent = "h"	-- Jump to parent
vim.g.NERDTreeMapToggleHidden = "<C-s>" -- Toggle hidden files

-- Split Navigation - Ctrl+move to swap between splits.
vim.keymap.set('n','<C-h>', '<ESC><C-w>h', { noremap = false })
vim.keymap.set('n','<C-j>', '<ESC><C-w>j', { noremap = false })
vim.keymap.set('n','<C-k>', '<ESC><C-w>k', { noremap = false })
vim.keymap.set('n','<C-l>', '<ESC><C-w>l', { noremap = false })

-- Compiling & File/Project Operations
vim.keymap.set({'n','i','v'},'<leader>c', [[:w! \| !compiler "%:p"<CR>]])	-- Compile document (for markup langs.)
vim.keymap.set('n', '<F3>', ':Autoformat<CR>')	-- Autoformat
vim.keymap.set('n', '<leader>s', ':!clear && shellcheck -x %<CR>')	-- Shell check
vim.keymap.set('n', '<leader>o', ':setlocal spell! spelllang=en_us<CR>')	-- Spell check
vim.keymap.set('n', '<leader>p', ':!opout "%:p"<CR>')	-- Open corresponding .pdf/.html or preview
