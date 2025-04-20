local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort, 
        null_ls.builtins.formatting.prettier, 
        null_ls.builtins.formatting.stylua,
    },
})

-- Shortcut to format
vim.api.nvim_set_keymap("n", "<leader>i", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
