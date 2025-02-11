local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- 🔹 FORMATEADORES
        null_ls.builtins.formatting.black,  -- Formatea código Python
        null_ls.builtins.formatting.isort,  -- Ordena imports en Python
        null_ls.builtins.formatting.ruff.with({
            command = "/home/sebastian/.pyenv/shims/ruff", -- Detecta Ruff automáticamente
        }),

        -- 🔹 LINTERS
        null_ls.builtins.diagnostics.flake8, -- Análisis de código Python
        null_ls.builtins.diagnostics.mypy,   -- Análisis de tipos en Python
        null_ls.builtins.diagnostics.ruff.with({
            command = "/home/sebastian/.pyenv/shims/ruff",
        }),
    },
})
