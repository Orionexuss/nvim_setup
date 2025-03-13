vim.cmd [[packadd packer.nvim]] -- Ensure packer.nvim is loaded

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope: Fuzzy finder for files, buffers, etc.
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',                             -- Use a specific tag for stability
    requires = { { 'nvim-lua/plenary.nvim' } } -- Required dependency
  }

  -- Treesitter: Syntax highlighting, code navigation, and more
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update() -- Ensure parsers are up-to-date
    end,
  }

  -- Visual Multi: Support for multiple cursors
  use "mg979/vim-visual-multi"

  -- Cyberdream Theme: Aesthetic colorscheme
  use { "scottmckendry/cyberdream.nvim" }

  -- Neo-tree: File explorer with enhanced UI
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",                 -- Use the latest stable version
    requires = {
      "nvim-lua/plenary.nvim",       -- Core Lua utilities
      "nvim-tree/nvim-web-devicons", -- Icons for better visualization
      "MunifTanjim/nui.nvim",        -- UI components library
    }
  }

  -- Mason: Manage LSP servers, linters, and formatters
  use { "williamboman/mason.nvim" }

  -- nvim-cmp: Autocompletion plugin
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",         -- LSP completions
      "hrsh7th/cmp-buffer",           -- Buffer completions
      "hrsh7th/cmp-path",             -- Path completions
      "hrsh7th/cmp-cmdline",          -- Command-line completions
      {
        "L3MON4D3/LuaSnip",           -- Snippet engine
        run = "make install_jsregexp" -- Ensure regex support is installed
      },
      "saadparwaiz1/cmp_luasnip"      -- Integration of LuaSnip with nvim-cmp
    },
    config = function()
      require("setup_cmp") -- Load custom nvim-cmp configuration
    end
  }

  -- LSP Config: Base configuration for LSP servers
  use "neovim/nvim-lspconfig"

  -- Comment.nvim: Easily comment and uncomment code
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup() -- Initialize Comment.nvim
    end
  }

  -- Git tools and UI enhancements
  -- use 'vim-airline/vim-airline' -- Statusline for Vim
  -- use 'vim-airline/vim-airline-themes' -- Themes for vim-airline
  use 'tpope/vim-fugitive'     -- Git commands within Vim
  use 'airblade/vim-gitgutter' -- Show git diff in the gutter

  -- Indentation guides
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require('ibl').setup() -- Setup indentation lines
    end
  }

  use 'airblade/vim-rooter'

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  -- use "github/copilot.vim"

  use 'godlygeek/tabular'
  use 'preservim/vim-markdown'
  -- install without yarn or npm

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })

  use 'nvimtools/none-ls.nvim'
  use({
    "olimorris/codecompanion.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    }
  })
  use 'windwp/nvim-ts-autotag'

  -- nvim v0.7.2
  use({
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  use {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup({
        options = { theme = 'material' }

      })
    end
  }


  use {
    "echasnovski/mini.indentscope",
    config = function()
      require("mini.indentscope").setup({
        delay = 180,
        symbol = "│"
      })
    end
  }
end)
