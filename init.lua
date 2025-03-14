local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("plugins")

require("options")
require("colorscheme")
require("lsp")
require("setup_mason")
require("setup_cmp")
require("keymaps")
require("setup_telescope")
require("treesitter")
require("neotree")
require("setup_codecompanion")
require("setup_null")
