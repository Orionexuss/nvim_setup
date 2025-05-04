local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("luasnip.loaders.from_vscode").lazy_load()

-- on_attach function: runs whenever an LSP server attaches to a buffer
local on_attach = function(client, bufnr)
	-- Show hover documentation with 'K' in Normal mode
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {
		noremap = true,
		silent = true,
		buffer = bufnr,
		desc = "LSP Hover Documentation",
	})

	-- You can add more LSP-related keymaps here if needed
	-- e.g. vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
end

-- Pyright setup
lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
		["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
	},
	settings = {
		python = {
			-- pythonPath = "~/hello-world-app/backend/.venv/bin/python",
			analysis = {
				extraPaths = { "..", "./", ".git" },
				diagnosticMode = "workspace",
				diagnosticSeverityOverrides = {
					reportIncompatibleMethodOverride = "none",
				},
			},
		},
	},
})


lspconfig.eslint.setup({
})

-- TypeScript setup
lspconfig.ts_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = function(...)
		return require("lspconfig.util").root_pattern(".git")(...)
	end,
	single_file_support = false,
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "literal",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
})

-- Lua setup
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	single_file_support = true,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
				disable = { "incomplete-signature-doc", "trailing-space" },
				groupSeverity = {
					strong = "Warning",
					strict = "Warning",
				},
				groupFileStatus = {
					["ambiguity"] = "Opened",
					["await"] = "Opened",
					["codestyle"] = "None",
					["duplicate"] = "Opened",
					["global"] = "Opened",
					["luadoc"] = "Opened",
					["redefined"] = "Opened",
					["strict"] = "Opened",
					["strong"] = "Opened",
					["type-check"] = "Opened",
					["unbalanced"] = "Opened",
					["unused"] = "Opened",
				},
				unusedLocalExclude = { "_*" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			completion = {
				workspaceWord = true,
				callSnippet = "Both",
			},
			misc = {
				parameters = {},
			},
			hint = {
				enable = true,
				setType = false,
				paramType = true,
				paramName = "Disable",
				semicolon = "Disable",
				arrayIndex = "Disable",
			},
			doc = {
				privateName = { "^_" },
			},
			type = {
				castNumberToInteger = true,
			},
			telemetry = {
				enable = false,
			},
			format = {
				enable = false,
				defaultConfig = {
					indent_style = "space",
					indent_size = "2",
					continuation_indent_size = "2",
				},
			},
		},
	},
})

-- CSS setup
lspconfig.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- TailwindCSS setup
lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = function(...)
		return require("lspconfig.util").root_pattern(".git")(...)
	end,
})

-- HTML setup
lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- YAML setup
lspconfig.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		yaml = {
			keyOrdering = false,
		},
	},
})

-- Function to scroll within a floating window
local function scroll_float(amount)
	local win = vim.api.nvim_get_current_win() -- Get the current active window
	local wins = vim.api.nvim_list_wins() -- Get a list of all windows in Neovim

	for _, w in ipairs(wins) do
		local config = vim.api.nvim_win_get_config(w) -- Get the configuration of each window
		if config.relative ~= "" then -- Check if the window is a floating window
			vim.api.nvim_win_call(w, function()
				-- Perform normal mode command to scroll
				-- "" (CTRL+e) scrolls down, "" (CTRL+y) scrolls up
				vim.cmd("normal! " .. amount .. "")
			end)
			return -- Exit after scrolling the first floating window found
		end
	end
end

-- Map <C-d> to scroll down inside floating windows
vim.keymap.set("n", "<C-d>", function()
	scroll_float(4) -- Scroll down by 4 lines
end, { silent = true })

-- Map <C-u> to scroll up inside floating windows
vim.keymap.set("n", "<C-u>", function()
	scroll_float(-4) -- Scroll up by 4 lines
end, { silent = true })
