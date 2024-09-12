vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "<A-o>", "o<Esc>k")
vim.keymap.set("n", "<A-O>", "O<Esc>j")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<A-*>", ":noh<CR>")

vim.keymap.set("n", "<A-=>", "magg0vG='a")

vim.g.background = "light"

vim.opt.swapfile = false
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"
vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.fileformats = { "unix", "dos" }

vim.api.nvim_exec([[
  augroup YankHighlight
	autocmd!
	autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  augroup END
]], false)

vim.opt.fileformats = { "unix", "dos" }

function RemoveCarriageReturn ()
	pcall(function()
    		vim.cmd([[%s/\r//g]])
	end)
end

vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI"}, {
    pattern = "*",    
	callback = RemoveCarriageReturn,
})
