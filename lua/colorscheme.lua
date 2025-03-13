require("cyberdream").setup({
	-- Main configuration
	transparent = true,   -- Enable/disable transparent background
	italic_comments = false, -- Disable italic for comments
	hide_fillchars = false, -- Replace all fillchars with ' ' for a clean look
	borderless_picker = true, -- Modern theme without borders for Telescope and fzf-lua
	terminal_colors = true, -- Enable terminal colors
	cache = false,        -- Disable highlight caching

	-- Color scheme configuration (previously under `theme`)
	variant = "default", -- Change to "light" or "auto"
	saturation = 1,  -- Value between 0 and 1
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
			["NeoTreeFileName"] = { fg = colors.blue, bold = false },
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
			["Constant"] = { fg = colors.white, bold = false },
			["Identifier"] = { fg = colors.green, bold = false },
			["markdownBold"] = { fg = colors.green, bold = false },
			["Bold"] = { fg = colors.green, bold = false },
			["@text.strong"] = { fg = colors.green, bold = false },
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

-- Set highlights for background
-- vim.api.nvim_set_hl(0, "Normal", { bg = Bg_color })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = Bg_color })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = Bg_color })

vim.cmd("colorscheme solarized-osaka")

vim.api.nvim_set_hl(0, "BoldGreen", { fg = "#00ff00", bold = false })


local ns_id = vim.api.nvim_create_namespace("BoldHighlight")

local function highlight_bold_text()
	local bufnr = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	for i, line in ipairs(lines) do
		local start = 1
		while true do
			local s, e = line:find("%*%*.-%*%*", start)
			if not s then break end
			vim.api.nvim_buf_add_highlight(bufnr, ns_id, "BoldGreen", i - 1, s - 1, e)
			start = e + 1
		end
	end
end

vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "TextChangedI" }, {
	callback = function()
		vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
		highlight_bold_text()
	end,
})
