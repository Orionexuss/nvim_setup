local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if not ok then
    return
end

ts_configs.setup {
    ensure_installed = { "lua", "python", "javascript", "html", "css", "markdown", "markdown_inline", "yaml", "rust" },
    sync_install = false,
    modules = {},
    autotag = {
	enable = true,
    },
    ignore_install = {},
    auto_install = true,
    highlight = {
        enable = true,
	 -- disable = { "markdown", "markdown_inline" },
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
}


