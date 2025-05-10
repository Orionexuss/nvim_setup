vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<leader>fg",
	":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fs", function()
	require("telescope.builtin").colorscheme({ enable_preview = true })
end, { noremap = true, silent = true })
