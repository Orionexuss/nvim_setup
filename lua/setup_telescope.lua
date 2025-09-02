local lga_actions = require("telescope-live-grep-args.actions")
local make_entry = require("telescope.make_entry")

require('telescope').setup({
  extensions = {
    vimgrep_arguments = {
      auto_quoting = true,
      "rg",
      "--hidden",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--glob=!**/__pycache__/*",
      "--glob=!**/*.pyc",
    },
    mappings = { -- extend mappings
      i = {
        ["<C-k>"] = lga_actions.quote_prompt(),
        ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        -- freeze the current list and start a fuzzy search in the frozen list
        ["<C-space>"] = lga_actions.to_fuzzy_refine,
      },
    },
    file_ignore_patterns = {
      "__pycache__",
      "%.pyc",
      "%.pyo",
      "%.DS_Store",
      "%.git/",
      "node_modules/"
    },
  }, 
  defaults = {
  }
})

require('telescope').load_extension('harpoon')

-- Keymaps for lsp
vim.keymap.set('n', 'gd', "<C-]>", { noremap = true, silent = true })
vim.keymap.set('n', 'gD', function() require('telescope.builtin').lsp_declarations() end, { noremap = true, silent = true })
vim.keymap.set('n', 'gi', function() require('telescope.builtin').lsp_implementations() end, { noremap = true, silent = true })
vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, { noremap = true, silent = true })


local original_gen_from_file = make_entry.gen_from_file

make_entry.gen_from_file = function(opts)
  local original_maker = original_gen_from_file(opts)

  return function(line)
    local entry = original_maker(line)
    if entry and entry.path then
      entry.path = entry.path:gsub("\\", "/")
    end
    return entry
  end
end
