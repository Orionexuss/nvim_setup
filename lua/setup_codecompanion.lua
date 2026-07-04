local codecompanion = require("codecompanion")

codecompanion.setup({
    opts = {
        language = "English",
    },

    prompt_library = {
        files = {
            "~/.config/nvim/prompts",
        },
    },
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        local name = vim.api.nvim_buf_get_name(0)

        if name:match("CodeCompanion") then
            vim.cmd("wincmd L")
        end
    end,
})
