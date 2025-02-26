-- Set up vim-rooter to change automaticatly to the main directory of the proyect
vim.g.rooter_patterns = { '.git/', 'Makefile', 'package.json' }

-- Avoid message when changing directories
vim.g.rooter_silent_chdir = 1

vim.api.nvim_set_keymap("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })

vim.cmd('syntax on')
vim.bo.filetype = 'markdown'

-- Execute current .py file
vim.api.nvim_set_keymap("n", "<F5>", ":w<CR>:!python3 %<CR>", { noremap = true, silent = true })

vim.g.python3_host_prog = "~/.pyenv/versions/3.13.1/bin/python"
vim.g.python_host_prog = "~/.pyenv/versions/3.13.1/bin/python"
vim.cmd("set verbosefile=~/.local/state/nvim/log")
vim.cmd("set verbose=15")


vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- set to true if you have a nerd font installed and selected in the terminal
vim.g.have_nerd_font = true


for _, mode in ipairs({"n", "v"}) do
  vim.api.nvim_set_keymap(mode, "<leader>ai", ":CodeCompanionChat<CR>", { noremap = true, silent = true })
end


-- make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"
vim.api.nvim_set_keymap("n", "<LeftMouse>", "<Nop>", { noremap = true, silent = true })


-- don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- sync clipboard between os and neovim.
--  schedule the setting after `uienter` because it can increase startup-time.
--  remove this option if you want your os clipboard to remain independent.
--  see `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- enable break indent
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- case-insensitive searching unless \c or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- decrease update time
vim.opt.updatetime = 250

-- decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- show which line your cursor is on
vim.opt.cursorline = true

-- minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ basic keymaps ]]
--  see `:help vim.keymap.set()`

-- clear highlights on search when pressing <esc> in normal mode
--  see `:help hlsearch`
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")

-- Neotre toggle
vim.keymap.set("n", "<A-n>", "<cmd>Neotree toggle<cr>")

-- diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "open diagnostic [q]uickfix list" })

-- highlight when yanking (copying) text
--  try it with `yap` in normal mode
--  see `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("textyankpost", {
	desc = "highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})


vim.opt.foldmethod = "expr"    -- Use expression-based folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"  -- Use Treesitter for better folding
vim.opt.foldenable = true      -- Enable folding
vim.opt.foldlevel = 99         -- Keep all folds open by default

