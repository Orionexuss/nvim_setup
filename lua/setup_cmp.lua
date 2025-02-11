local cmp = require('cmp')

-- Global setup.
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- Para usuarios de `luasnip`
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    -- Desplazar docs
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    
    -- Forzar menú de completado
    ['<C-Space>'] = cmp.mapping.complete(),
    
    -- Confirmar selección con Enter
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    
    -- Navegar en la lista de sugerencias con Ctrl+j / Ctrl+k
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
    { name = 'luasnip' }, -- Para usuarios de `luasnip`
  }, {
    { name = 'buffer' },
  }),
})

-- Configuración para `/` en línea de comandos
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Configuración para `:` en línea de comandos
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  -- Opcional: permitir coincidencia parcial de símbolos
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Setup de lspconfig
local capabilities = require('cmp_nvim_lsp').default_capabilities()


require('lspconfig').ts_ls.setup {
  capabilities = capabilities
}

require('lspconfig').lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- Usa la versión de runtime que Neovim utiliza
      },
      diagnostics = {
        globals = { 'vim' }, -- Reconoce 'vim' como global para evitar errores
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- Incluye runtime de Neovim
        checkThirdParty = false, -- Desactiva la advertencia de dependencias externas
      },
      telemetry = {
        enable = false, -- Desactiva la telemetría
      },
    },
  },
}
