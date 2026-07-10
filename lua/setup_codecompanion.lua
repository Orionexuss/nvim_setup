local codecompanion = require("codecompanion")

codecompanion.setup({
    opts = {
        language = "English",
    },

    display = {
        action_palette = {
            provider = "snacks",
        },
    },

    interactions = {
        chat = {
            adapter = "copilot",
            slash_commands = {
                opts = {
                    acp = {
                        enabled = false,
                    },
                },
            },
        },
    },

    prompt_library = {
        files = {
            "~/.config/nvim/prompts",
        },
    },
})

local codecompanion_layout_group = vim.api.nvim_create_augroup("CodeCompanionLayout", { clear = true })

vim.api.nvim_create_autocmd("BufWinEnter", {
    group = codecompanion_layout_group,
    pattern = "*",
    callback = function(args)
        local bufnr = args.buf
        if not vim.api.nvim_buf_is_valid(bufnr) then
            return
        end

        local name = vim.api.nvim_buf_get_name(bufnr)
        if not name:match("CodeCompanion") then
            return
        end

        -- Defer the move so we do not modify layout while another window is closing.
        vim.schedule(function()
            if not vim.api.nvim_buf_is_valid(bufnr) then
                return
            end

            local winid = vim.fn.bufwinid(bufnr)
            if winid == -1 then
                return
            end

            pcall(vim.api.nvim_win_call, winid, function()
                vim.cmd("wincmd L")
            end)
        end)
    end,
})
