
require("mason").setup({
    install_root_dir = vim.fn.stdpath("data") .. "/mason",
    PATH = "append",
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
    ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "black",
        "emmet-ls",
        "pyright",
        "eslint-lsp",
        "flake8",
        "html-lsp",
        "isort",
        "lua-language-server",
        "prettier",
    },
    ---@since 1.0.0
    -- [Advanced setting]
    -- The registries to source packages from. Accepts multiple entries. Should a package with the same name exist in
    -- multiple registries, the registry listed first will be used.
    registries = {
        "github:mason-org/mason-registry",
    },
    github = {
        ---@since 1.0.0
        -- The template URL to use when downloading assets from GitHub.
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },

    pip = {
        ---@since 1.0.0
        -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
        upgrade_pip = false,

        ---@since 1.0.0
        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
        -- and is not recommended.
        --
        -- Example: { "--proxy", "https://proxyserver" }
        install_args = {},
    },
    providers = {
        "mason.providers.registry-api",
        "mason.providers.client",
    },
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
