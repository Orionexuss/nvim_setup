require("cyberdream").setup({
    -- Habilitar fondo transparente
    transparent = false,

    -- Deshabilitar comentarios en cursiva
    italic_comments = false,

    -- Reemplazar todos los fillchars con ' ' para un diseño limpio
    hide_fillchars = false,

    -- Tema moderno sin bordes para Telescope y fzf-lua
    borderless_telescope = true,

    -- Colores para el terminal
    terminal_colors = true,

    -- Deshabilitar caché de highlights
    cache = false,

    theme = {
        variant = "default", -- Cambiar a "light" o "auto"
        saturation = 1, -- Valor entre 0 y 1

        highlights = {
            -- Grupos de resaltado personalizados
            Comment = { fg = "#696969", bg = "NONE", italic = true },
        },

        -- Sobrescribir grupos de resaltado usando la paleta de colores
        overrides = function(colors)
            if not colors then
                colors = {
                    grey = "#808080",
                    blue = "#0000ff",
                    green = "#b3fcb0",
                    orange = "#ff8800",
                    fg = "#ffffff",
                }
            end
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

        -- Sobrescribir colores
        colors = {
            bg = "#000000",
	    low_green = "#8cd786",
            magenta = "#ff00ff",
	    green = "#b3fcb0",
	    blue = "#9f9efe",
	    white = "#cbcbcb"
        },
    },

    -- Extensiones
    extensions = {
        telescope = true,
        notify = true,
        mini = true,
    },
})


Bg_color = '#0a0b0a'
-- Aplicar esquema de colores
vim.cmd("colorscheme cyberdream")
vim.api.nvim_set_hl(0, "Normal", { bg = Bg_color })
vim.api.nvim_set_hl(0, "NormalNC", { bg = Bg_color})
vim.api.nvim_set_hl(0, "SignColumn", { bg = Bg_color })


