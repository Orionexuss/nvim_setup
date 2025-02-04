
vim.cmd [[packadd packer.nvim]] -- Ensure packer.nvim is loaded

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope: Fuzzy finder and more
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8', -- Specific tag for stability
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Treesitter: Syntax highlighting and more
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- Visual Multi: Multiple cursors for editing
    use "mg979/vim-visual-multi"

    -- Cyberdream Theme
    use { "scottmckendry/cyberdream.nvim" }

    -- Neo-tree: File explorer
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x", -- Use the latest stable version
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- Icons for a better UI
            "MunifTanjim/nui.nvim", -- UI components
        }
    }

    -- Mason: Manage LSP servers, formatters, linters
    use { "williamboman/mason.nvim" }

    -- nvim-cmp: Autocompletion plugin
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",    -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer",      -- Buffer completions
            "hrsh7th/cmp-path",        -- Path completions
            "hrsh7th/cmp-cmdline",     -- Command-line completions
            {
                "L3MON4D3/LuaSnip",    -- Snippet engine
                run = "make install_jsregexp" -- Ensure regex support is installed
            },
            "saadparwaiz1/cmp_luasnip" -- LuaSnip integration with nvim-cmp
        },
        config = function()
            require("setup_cmp") -- Custom nvim-cmp configuration
        end
    })

    -- LSP Config: Base for configuring LSP servers
    use "neovim/nvim-lspconfig"

    -- Comment.nvim: Easily comment code
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Git branch shown at the bottom
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'
	use 'tpope/vim-fugitive'             -- Soporte para Git
	use 'airblade/vim-gitgutter' 

	-- Identation lines
	use {"lukas-reineke/indent-blankline.nvim",
	config = function()
		require('ibl').setup()
		IBLEnable= true
	end}
end)
