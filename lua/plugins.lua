return require("lazy").setup({

  -- Telescope plugin
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Treesitter plugin
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
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
    }
  },

  -- Mason plugin
  { "williamboman/mason.nvim" },

  -- nvim-cmp and Snippets plugin for autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp"
      },
      "saadparwaiz1/cmp_luasnip"
    },
    config = function()
      require("setup_cmp")
    end
  },

  -- LSP Config plugin
  { "neovim/nvim-lspconfig" },

  -- Comment.nvim plugin
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  -- Git plugins
  { 'tpope/vim-fugitive' },
  { 'airblade/vim-gitgutter' },

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
  { 'airblade/vim-rooter' },

  -- nvim-surround plugin
  {
    "kylechui/nvim-surround",
    version = "*",
    config = function()
      require("nvim-surround").setup({})
    end
  },

  -- Tabular and vim-markdown plugins
  { 'godlygeek/tabular' },
  { 'preservim/vim-markdown' },

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
  { 'nvimtools/none-ls.nvim' },

  -- codecompanion plugin
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    }
  },
  { 'windwp/nvim-ts-autotag' },

  -- LazyGit plugin
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.g.lazygit_floating_window_winblend = 0
      vim.env.LAZYGIT_USE_CUSTOM_CONFIG_FILE_PATH = "1"
      vim.env.LAZYGIT_CONFIG_FILE = vim.fn.expand("~/.config/lazygit/config.yml")
    end
  },

  -- nvim-autopairs plugin
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end
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
      vim.cmd("colorscheme solarized-osaka")
    end
  },

  -- lualine plugin for status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = { theme = 'material' }
      })
    end
  },

  -- mini.indentscope plugin
  {
    "echasnovski/mini.indentscope",
    config = function()
      require("mini.indentscope").setup({
        delay = 180,
        symbol = "│"
      })
    end
  },

  -- Treesitter Playground plugin
  {
    "nvim-treesitter/playground",
    cmd = "TSHighlightCapturesUnderCursor"
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
      require("setup_swenv").setup()
    end
  },

  { 'folke/snacks.nvim' },
})
