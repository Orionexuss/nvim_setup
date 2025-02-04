require("neo-tree").setup({
    close_if_last_window = true, -- Cierra Neo-tree si es la última ventana abierta
    popup_border_style = "rounded", -- Estilo de bordes
    enable_git_status = true, -- Muestra el estado de Git
    enable_diagnostics = true, -- Muestra problemas en el árbol
    cwd_target = {
	    workspace = false,
	    current = true,
	},
    filesystem = {
        filtered_items = {
	    visible = true,	
            hide_dotfiles = false, -- Muestra archivos ocultos
            hide_gitignored = false, -- Oculta archivos ignorados por Git
        },
        follow_current_file = { 
			enabled = true,
			cleanup = true,
		}, 
	hijack_netrw_behavior = "open_current", -- Opcional: reemplaza netrw
        use_libuv_file_watcher = true, -- Actualización automática del árbol
    },
    window = {
        position = "left", -- Posición del árbol
        width = 30, -- Ancho del panel
        mappings = {
            ["<space>"] = "toggle_node", -- Abrir/cerrar nodos con espacio
            ["<cr>"] = "open", -- Abrir archivo o directorio
            ["<esc>"] = "revert_preview", -- Cerrar previsualización
        },
    },
    git_status = {
        window = {
            position = "float",
        },
    },
})


