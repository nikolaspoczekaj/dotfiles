return {
	'ThePrimeagen/harpoon',
	config = function()
		vim.keymap.set("n", "<leader>hh", function()
			require("harpoon.ui").toggle_quick_menu()
		end)
		vim.keymap.set("n", "<leader>ha", function()
			require("harpoon.mark").add_file()
		end)
		vim.keymap.set("n", "<leader>hn", function()
			require("harpoon.ui").nav_next()
		end)
	end
}
