
return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function ()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"tailwindcss",
					"ts_ls",
					"html",
					"lua_ls",
					"pyright",

				}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				filetypes = { "html", "css", "scss", "less" }
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
			})
			lspconfig.solargraph.setup({
				capabilities = capabilities
			})
			lspconfig.html.setup({
				capabilities = capabilities
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities
			})
			lspconfig.pyright.setup({
				filetypes = { "python" },
				capabilities = capabilities
			})


			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		end,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},
}

