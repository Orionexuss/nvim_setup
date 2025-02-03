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
