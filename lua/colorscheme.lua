
require("cyberdream").setup({
    -- Main configuration
    transparent = false, -- Enable/disable transparent background
    italic_comments = false, -- Disable italic for comments
    hide_fillchars = false, -- Replace all fillchars with ' ' for a clean look
    borderless_picker = true, -- Modern theme without borders for Telescope and fzf-lua
    terminal_colors = true, -- Enable terminal colors
    cache = false, -- Disable highlight caching

    -- Color scheme configuration (previously under `theme`)
    variant = "default", -- Change to "light" or "auto"
    saturation = 1, -- Value between 0 and 1
    highlights = {
        -- Custom highlight groups
        Comment = { fg = "#696969", bg = "NONE", italic = true },
    },

    -- Override highlight groups using the color palette
    overrides = function(colors)
        -- Default color palette if not provided
        if not colors then
            colors = {
                grey = "#808080",
                blue = "#0000ff",
                green = "#b3fcb0",
                orange = "#ff8800",
                fg = "#ffffff",
            }
        end
        -- Custom highlight group overrides
        return {
            Comment = { fg = colors.grey, bg = "NONE", italic = true },
            ["@property"] = { fg = colors.white, bold = false },
            ["@module"] = { fg = colors.white, bold = false },
            ["@string"] = { fg = colors.green, bold = false },
            ["NeoTreeFileName"] = { fg = colors.grey, bold = false },
            ["Directory"] = { fg = colors.fg, bold = false },
            ["NeoTreeDirectoryIcon"] = { fg = colors.orange, bold = false },
            ["@variable"] = { fg = colors.white, bold = false },
            ["@keyword"] = { fg = colors.low_green, bold = false },
            ["Number"] = { fg = colors.red, bold = false },
            ["Keyword"] = { fg = colors.low_green, bold = false },
            ["Operator"] = { fg = colors.low_green, bold = false },
            ["Boolean"] = { fg = colors.low_green, bold = false },
            ["Type"] = { fg = colors.white, bold = false },
            ["Special"] = { fg = colors.blue, bold = false },
            ["PreProc"] = { fg = colors.blue, bold = false },
        }
    end,

    -- Overwrite colors
    colors = {
        bg = "#000000",
        low_green = "#8cd786",
        magenta = "#ff00ff",
        green = "#b3fcb0",
        blue = "#9f9efe",
        white = "#cbcbcb",
    },

    -- Extensions
    extensions = {
        telescope = true, -- Enable support for Telescope
        notify = true, -- Enable support for notifications
        mini = true, -- Enable support for mini plugins
    },
})

-- Set background color
Bg_color = "#0a0b0a"

-- Apply the color scheme
vim.cmd("colorscheme cyberdream")

-- Set highlights for background
vim.api.nvim_set_hl(0, "Normal", { bg = Bg_color })
vim.api.nvim_set_hl(0, "NormalNC", { bg = Bg_color })
vim.api.nvim_set_hl(0, "SignColumn", { bg = Bg_color })
