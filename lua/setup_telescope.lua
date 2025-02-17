
-- Try to load Telescope safely
local status, telescope = pcall(require, "telescope")
if not status then
  print("Error loading Telescope: " .. tostring(telescope)) -- Print an error if Telescope fails to load
  return  -- Exit to prevent further errors
end
--
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
