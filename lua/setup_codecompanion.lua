
-- Attempt to load the CodeCompanion plugin
local status, codecompanion = pcall(require, "codecompanion")


-- Set up CodeCompanion with specific configurations
codecompanion.setup({
  -- adapter = "openai",  -- Use OpenAI as the adapter
  api_key = os.getenv("OPENAI_API_KEY"),  -- Retrieve the API key from environment variables
  strategies = {
    chat = { agent = "chat", model = "gpt-4" },  -- Configure a chat strategy using GPT-4 model
  }
})
      
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        local bufname = vim.api.nvim_buf_get_name(0)
        if string.match(bufname, "CodeCompanion") then
            vim.cmd("wincmd L") -- Moves the buffer to the right
        end
    end,
})
