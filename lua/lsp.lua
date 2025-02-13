local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('luasnip.loaders.from_vscode').lazy_load()

-- on_attach function: runs whenever an LSP server attaches to a buffer
local on_attach = function(client, bufnr)
  -- Show hover documentation with 'K' in Normal mode
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {
    noremap = true,
    silent = true,
    buffer = bufnr,
    desc = 'LSP Hover Documentation',
  })

  -- You can add more LSP-related keymaps here if needed
  -- e.g. vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
end

-- Pyright setup
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "/home/sebastian/.nvm/versions/node/v22.13.1/bin/pyright-langserver", "--stdio" },
  settings = {
    python = {
      pythonPath = "/home/sebastian/venvs/pytest_env/bin/python3",
      analysis = {
		extraPaths = {"..", "./", ".git"},
		diagnosticMode = "workspace",
		diagnosticSeverityOverrides = {
                    reportIncompatibleMethodOverride = "none" -- Avoid static analysis
		}
      }
    },
  },
})

-- TypeScript setup
lspconfig.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',  -- Usa la versión de runtime de Neovim
      },
      diagnostics = {
        globals = { 'vim' }, -- Reconoce 'vim' como global para que no marque error
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false, -- Desactiva advertencias de dependencias externas
      },
      telemetry = {
        enable = false, -- Desactiva la telemetría
      },
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
