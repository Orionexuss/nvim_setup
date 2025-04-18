require('telescope').setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--hidden",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--glob=!**/__pycache__/*",
      "--glob=!**/*.pyc"
    },
    file_ignore_patterns = {
      "__pycache__",
      "%.pyc",
      "%.pyo",
      "%.DS_Store",
      "%.git/",
      "node_modules/"
    },
  }
})

require('telescope').load_extension('harpoon')

-- Keymaps for lsp
vim.keymap.set('n', 'gd', function() require('telescope.builtin').lsp_definitions() end, { noremap = true, silent = true })
vim.keymap.set('n', 'gD', function() require('telescope.builtin').lsp_declarations() end, { noremap = true, silent = true })
vim.keymap.set('n', 'gi', function() require('telescope.builtin').lsp_implementations() end, { noremap = true, silent = true })
vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, { noremap = true, silent = true })
