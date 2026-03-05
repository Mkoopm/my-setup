return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    adapters = {
      http = { -- <-- must be nested under http
        azure_openai = function()
          return require("codecompanion.adapters").extend("azure_openai", {
            env = {
              api_key = "AZURE_OPENAI_API_KEY",
              endpoint = "AZURE_OPENAI_ENDPOINT",
            },
            schema = {
              model = { default = "gpt-4o" }, -- your deployment name
            },
          })
        end,
      },
    },
    interactions = { -- <-- was "strategies" in older versions
      chat = { adapter = "azure_openai" },
      inline = { adapter = "azure_openai" },
      cmd = { adapter = "azure_openai" },
    },
  },
  keys = {
    { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "AI Chat", mode = { "n", "v" } },
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "AI Actions", mode = { "n", "v" } },
    { "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "AI Inline", mode = { "n", "v" } },
  },
}
