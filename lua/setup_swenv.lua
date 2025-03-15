local M = {}

function M.setup()
  local swenv_api = require("swenv.api")
  local settings = require("swenv.config").settings

  local Snacks = require("snacks")

  function swenv_api.pick_venv()
    local venvs = settings.get_venvs(settings.venvs_path)

    Snacks.picker.select(
      venvs,
      {
        prompt = "Select a virtual environment",
        format_item = function(item)
          return string.format("%s (%s) [%s]", item.name, item.path, item.source)
        end,
      },
      function(choice)
        if choice then
          swenv_api.set_venv(choice)
        else
          print("Selection cancelled")
        end
      end
    )
  end

  vim.api.nvim_create_user_command("PickVenv", function()
    swenv_api.pick_venv()
  end, {})

  vim.keymap.set("n", "<leader>sv", function()
    swenv_api.pick_venv()
  end, { desc = "Select python venv with Snacks" })
end

return M
