return require("lazy").setup({
	-- Avante plugin
	{ import = "avante_setup" },

	-- Telescope plugin
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("live_grep_args")
		end,
	},

	-- Treesitter plugin
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},

	-- Visual Multi plugin
	{ "mg979/vim-visual-multi" },

	-- Cyberdream Theme plugin
	{ "scottmckendry/cyberdream.nvim" },

	-- Neo-tree plugin
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},

	-- Mason plugin
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true, -- Enable automatic installation
				ensure_installed = {
					"rust_analyzer", -- Only install rust_analyzer via Mason
				},
			})
		end,
	},

	-- nvim-cmp and Snippets plugin for autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"mlaursen/vim-react-snippets",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },

			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp",
			},
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function(_, opts)
			opts.formatting = {
				format = require("tailwindcss-colorizer-cmp").formatter,
			}
			require("vim-react-snippets").lazy_load()
			local config = require("vim-react-snippets.config")
			config.readonly_props = false
		end,
		config = function()
			require("setup_cmp")
		end,
	},

	-- LSP Config plugin
	{ "neovim/nvim-lspconfig" },

	-- Comment.nvim plugin
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Git plugins
	{ "tpope/vim-fugitive" },
	{ "airblade/vim-gitgutter" },

	-- Indent Blankline plugin
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			exclude = {
				filetypes = {
					"dashboard",
				},
			},
		},
	},
	-- vim-rooter plugin
	{ "airblade/vim-rooter" },

	-- nvim-surround plugin
	{
		"kylechui/nvim-surround",
		version = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- Tabular and vim-markdown plugins
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "codecompanion" },
	},
	{ "godlygeek/tabular" },
	{ "preservim/vim-markdown" },

	-- markdown-preview plugin
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- none-ls plugin
	{ "nvimtools/none-ls.nvim" },

	-- codecompanion plugin
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{ "windwp/nvim-ts-autotag" },

	-- LazyGit plugin
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			vim.g.lazygit_floating_window_winblend = 0
			vim.env.LAZYGIT_USE_CUSTOM_CONFIG_FILE_PATH = "1"
			vim.env.LAZYGIT_CONFIG_FILE = vim.fn.expand("~/.config/lazygit/config.yml")
		end,
	},

	-- nvim-autopairs plugin
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
	},

	-- solarized-osaka plugin
	{
		"craftzdog/solarized-osaka.nvim",
		config = function()
			require("solarized-osaka").setup({
				on_highlights = function(highlights)
					highlights["@module.python"] = { fg = "#849900" }
					highlights["@keyword.import.python"] = { fg = "#c94c16" }
				end,
			})
		end,
	},

	-- lualine plugin for status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local function get_virtualenv()
				local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV")
				if venv then
					return string.format(" %s", vim.fn.fnamemodify(venv, ":t"))
				end
				return ""
			end

			require("lualine").setup({
				options = { theme = "nightfly" },
				sections = {
					lualine_c = { "filename" },
					lualine_z = { get_virtualenv },
				},
			})
		end,
	},

	-- mini.indentscope plugin
	{
		"echasnovski/mini.indentscope",
		config = function()
			require("mini.indentscope").setup({
				delay = 180,
				symbol = "│",
			})
		end,
	},

	-- Treesitter Playground plugin
	{
		"nvim-treesitter/playground",
		cmd = "TSHighlightCapturesUnderCursor",
	},

	-- Dashboard
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
	},

	-- Python venvs
	{
		"AckslD/swenv.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			vim.keymap.set("n", "<leader>ve", function()
				require("swenv.api").pick_venv()
			end, { desc = "Pick and set Python venv" })

			require("swenv").setup({
				post_set_venv = function()
					vim.cmd("LspRestart")
				end,
			})
		end,
	},

	{ "folke/snacks.nvim" },

	-- rose-pine theme
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
				styles = {
					italic = false,
				},
			})
		end,
	},

	{ "folke/tokyonight.nvim" },

	{
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<C-l>",
					accept_word = "<M-l>",
					accept_line = "<M-S-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				markdown = true,
				help = true,
				terminal = true,
			},
		},
	},

	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
	},

	{ "theprimeagen/harpoon" },

	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				tailwind = true,
			},
		},
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "SS",    mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
	},
	{ "miikanissi/modus-themes.nvim" },

	-- {
	-- 	"mrcjkb/rustaceanvim",
	-- 	version = "^6",
	-- 	lazy = false,
	-- 	ft = "rust",
	-- 	config = function()
	-- 		local mason_data = vim.fn.stdpath("data") .. "/mason/packages"

	-- 		local install_path = mason_data .. "/codelldb"
	-- 		local extension_dir = install_path .. "/extension"
	-- 		local adapter_path = extension_dir .. "/adapter/codelldb"
	-- 		local liblldb_path = extension_dir .. "/lldb/lib/liblldb.so"

	-- 		if vim.fn.isdirectory(install_path) == 0 then
	-- 			vim.notify(
	-- 				"Couldn't find codelldb in:\n  "
	-- 					.. install_path
	-- 					.. "\nExecute :MasonInstall codelldb and reload Neovim",
	-- 				vim.log.levels.ERROR
	-- 			)
	-- 			return
	-- 		end

	-- 		-- Define on_attach function for RustaceanVim
	-- 		local on_attach = function(client, bufnr)
	-- 			-- Show hover documentation with 'K' in Normal mode
	-- 			vim.keymap.set("n", "K", vim.lsp.buf.hover, {
	-- 				noremap = true,
	-- 				silent = true,
	-- 				buffer = bufnr,
	-- 				desc = "LSP Hover Documentation",
	-- 			})
	-- 		end

	-- 		local cfg = require("rustaceanvim.config")
	-- 		vim.g.rustaceanvim = {
	-- 			tools = {
	-- 				hover_actions = {
	-- 					auto_focus = true,
	-- 				},
	-- 			},
	-- 			server = {
	-- 				on_attach = false, -- Disable LSP functionality
	-- 			},
	-- 			dap = {
	-- 				adapter = cfg.get_codelldb_adapter(adapter_path, liblldb_path),
	-- 			},
	-- 		}
	-- 	end,
	-- },

	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},

	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
		end,
	},

	{
		"saecki/crates.nvim",
		ft = { "toml" },
		config = function()
			require("crates").setup({
				completion = {
					cmp = {
						enabled = true,
					},
				},
			})
			require("cmp").setup.buffer({
				sources = { { name = "crates" } },
			})
		end,
	},

	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nightflyTransparent = true
		end,
	},
})
