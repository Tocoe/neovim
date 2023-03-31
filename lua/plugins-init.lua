--[[
	╔╗
	║║
╔══╗║║ ╔╗╔╗╔══╗╔╗╔══╗╔══╗
║╔╗║║║ ║║║║║╔╗║╠╣║╔╗║║══╣
║╚╝║║╚╗║╚╝║║╚╝║║║║║║║╠══║
║╔═╝╚═╝╚══╝╚═╗║╚╝╚╝╚╝╚══╝
║║		   ╔═╝║
╚╝		   ╚══╝
--]]

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

-- Theme
Plug ('catppuccin/nvim', { as = 'catppuccin' })

-- UI Related
Plug 'ap/vim-css-color'	-- Hex color previews
Plug 'preservim/nerdtree'	-- File browser for nvim
Plug 'vim-airline/vim-airline'	-- Status bar
Plug 'ryanoasis/vim-devicons'	-- Icon support for vim
Plug 'lukas-reineke/indent-blankline.nvim'	-- sexy indents
Plug ('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn['TSUpdate']})

-- Vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

-- Autocompletion
Plug 'hrsh7th/nvim-cmp' -- Completion main plugin
Plug 'hrsh7th/cmp-buffer' -- Buffer completion
Plug 'hrsh7th/cmp-path' -- Path completion
Plug 'hrsh7th/cmp-cmdline' -- cmdline completion
Plug 'hrsh7th/cmp-nvim-lsp' -- Lsp completion
Plug ('gelguy/wilder.nvim', { as = 'wilder', ['do'] = vim.fn['let &rtp=&rtp UpdateRemotePlugins']})	-- nicer custom wildmenu extension
Plug ('roxma/nvim-yarp', { ['do'] = vim.fn['pip install -r requirements.txt']})
Plug 'roxma/vim-hug-neovim-rpc'

-- LSP
Plug 'neovim/nvim-lspconfig' -- Nvim official LSP config

-- Additional Motions & Functions
Plug 'tpope/vim-commentary' -- allows for rapid line commenting
Plug 'tpope/vim-surround'	-- easily change surrounding syntax e.g. () '' {} []

-- Project Productivity Tools
Plug 'jreybert/vimagit' -- tools for editing git master
Plug 'vimwiki/vimwiki'	-- create a custom vim wiki with hyperlinks, perfect for notes and directories
Plug 'lervag/vimtex'	-- toolset for live compilation of laTex markup
Plug 'williamboman/mason.nvim'	-- package manager for neovim
Plug 'williamboman/mason-lspconfig.nvim'	-- LSP integration for mason

vim.call('plug#end')
