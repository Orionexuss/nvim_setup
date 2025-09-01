-- Rust filetype configuration for rustaceanvim
-- This file is automatically sourced for Rust files

local bufnr = vim.api.nvim_get_current_buf()

-- Add other useful Rust-specific keymaps
vim.keymap.set("n", "<leader>c", function()
	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>r", function()
	vim.cmd.RustLsp("runnables")
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>db", function()
	vim.cmd.RustLsp("debuggables")
end, { silent = true, buffer = bufnr })
