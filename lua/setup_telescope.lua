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
