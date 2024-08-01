
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'

	use 'hrsh7th/nvim-cmp' -- Completion Plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP Source for nvim-cmp
	use 'hrsh7th/cmp-buffer' -- Buffer Source for nvim-cmp
	use 'hrsh7th/cmp-path' -- Path Source for nvim-cmp
	use 'hrsh7th/cmp-cmdline' -- Cmdline Source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets Plugin
	use 'saadparwaiz1/cmp_luasnip' -- Snippets Source for nvim-cmp
	use 'jmcantrell/vim-virtualenv'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                        , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use ({ 'catppuccin/nvim',
		as = 'catppuccin',
		config = function ()
			vim.cmd('colorscheme catppuccin')
		end})
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('williamboman/mason.nvim')
	use('williamboman/mason-lspconfig.nvim')
	use({
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-lua/plenary.nvim"
		},
	})
	use {
		'nvim-tree/nvim-tree.lua',
		requires = { 'nvim-tree/nvim-web-devicons' }, -- optional, für Icons
		config = function()
			require('nvim-tree').setup {
				-- Deine Konfiguration hier
			}
		end
	}
	use {
		"github/copilot.vim",
		config = function()
			-- Optional: spezifische Konfiguration für copilot.vim hier hinzufügen
		end
	}

end)

