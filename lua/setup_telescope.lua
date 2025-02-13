
-- Try to load Telescope safely
local status, telescope = pcall(require, "telescope")
if not status then
  print("Error loading Telescope: " .. tostring(telescope)) -- Print an error if Telescope fails to load
  return  -- Exit to prevent further errors
end

-- Configure Telescope
require('telescope').setup {
  defaults = {
    -- Arguments for file searching using ripgrep (rg)
    vimgrep_arguments = {
      "rg",                        -- Use ripgrep for fast searching
      "--glob=!**/__pycache__/*",  -- Exclude all files inside __pycache__ directories
      "--glob=!**/*.pyc",           -- Exclude all .pyc files
    },

    -- Define patterns for files/directories that should be ignored in search results
    file_ignore_patterns = {
      "__pycache__",  -- Ignore all __pycache__ directories
      "%.pyc$"        -- Ignore all .pyc files
    }
  },

  -- Key mappings for Telescope in insert mode
  mappings = {
    i = {
      -- Bind <C-h> to "which_key" inside Telescope (default: <C-/>)
      ["<C-h>"] = "which_key"
    }
  },

  -- Configuration for specific built-in Telescope pickers
  pickers = {
    -- Example:
    -- find_files = {
    --   theme = "dropdown", -- Use a dropdown layout for file search
    -- }
  },

  -- Configuration for optional Telescope extensions
  extensions = {
    -- Example:
    -- fzf = {
    --   fuzzy = true,        -- Enable fuzzy matching
    --   override_generic_sorter = true, -- Replace default sorting algorithm
    --   override_file_sorter = true,
    --   case_mode = "smart_case", -- Use smart case sensitivity for searching
    -- }
  }
}
