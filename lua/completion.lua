-- cmp setup
local cmp = require'cmp'
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
		vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		['<C-h>'] = cmp.mapping.scroll_docs(-4),
		['<C-l>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<Tab>'] = cmp.mapping.abort(),
		['<C-Space>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
	},{
		{ name = 'buffer' },
	})
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['lua_ls'].setup {
	capabilities = capabilities
}
require('lspconfig')['clangd'].setup {
	capabilities = capabilities
}
require('lspconfig')['texlab'].setup {
	capabilities = capabilities
}
require('lspconfig')['pyright'].setup {}
