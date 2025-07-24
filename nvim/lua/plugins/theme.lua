return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "catppuccin",
      -- ... the rest of your lualine config
    },
  },
}
