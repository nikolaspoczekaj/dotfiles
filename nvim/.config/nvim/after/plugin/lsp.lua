local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
	'tsserver',
	'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()
