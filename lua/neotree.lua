require("neo-tree").setup({
    close_if_last_window = true, -- Closes Neo-tree if it is the last open window
    popup_border_style = "rounded", -- Border style
    enable_git_status = true, -- Shows Git status
    enable_diagnostics = true, -- Shows issues in the tree
    cwd_target = {
        workspace = false,
        current = true,
    },
    filesystem = {
        filtered_items = {
            visible = true,	
            hide_dotfiles = true, -- Shows hidden files
            hide_gitignored = false, -- Hides files ignored by Git
        },
        follow_current_file = { 
            enabled = true,
            cleanup = true,
        }, 
        hijack_netrw_behavior = "open_current", -- Optional: replaces netrw
        use_libuv_file_watcher = true, -- Automatic tree update
    },
    window = {
        position = "left", -- Tree position
        width = 30, -- Panel width
        mappings = {
            ["<space>"] = "toggle_node", -- Open/close nodes with space
            ["<cr>"] = "open", -- Open file or directory
            ["<esc>"] = "revert_preview", -- Close preview
	    ["f"] = nil,
        },
    },
    git_status = {
        window = {
            position = "float",
        },
    },
})

