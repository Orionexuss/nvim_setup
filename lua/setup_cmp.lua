-- Import the 'cmp' module for completion
local cmp = require('cmp')

-- Global setup for 'cmp'
cmp.setup({
  snippet = {
    -- Function to expand snippets using 'luasnip'
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For 'luasnip' users
    end,
  },
  window = {
    -- Configure completion window with borders
    completion = cmp.config.window.bordered(),
    -- Configure documentation window with borders
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    -- Scroll documentation up
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    -- Scroll documentation down
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    -- Trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Confirm selection with Enter
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- Navigate suggestion list with Ctrl+j / Ctrl+k
    ['<C-j>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<C-k>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For 'luasnip' users
  }, {
    { name = 'buffer' },
  }),
})

-- Setup for `/` in command line
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Setup for `:` in command line
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  -- Optional: allow partial symbol matching
  matching = { disallow_symbol_nonprefix_matching = false }
})


-- Setup for lspconfig
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Configure TypeScript language server
require('lspconfig').ts_ls.setup {
  capabilities = capabilities
}

-- Configure Lua language server
require('lspconfig').lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- Use the runtime version that Neovim uses
      },
      diagnostics = {
        globals = { 'vim' }, -- Recognize 'vim' as global to avoid errors
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime
        checkThirdParty = false,                           -- Disable third-party dependency warning
      },
      telemetry = {
        enable = false, -- Disable telemetry
      },
    },
  },
}



require("lspconfig").emmet_ls.setup({
  cmd = {
    vim.fn.stdpath("data") .. "/mason/bin/emmet-ls",
    "--stdio"
  },
  filetypes = { "html", "css", "javascriptreact", "typescriptreact", "vue", "svelte", "php", "markdown" },
  init_options = {
    html = {
      options = {}
    }
  },
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

require('lspconfig').html.setup {
  capabilities = capabilities,
}

require('lspconfig').cssls.setup {
  capabilities = capabilities,
}
