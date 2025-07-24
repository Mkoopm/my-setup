return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "catppuccin",
      -- ... the rest of your lualine config
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- You can merge with existing options or completely override
      -- For rounded corners, you typically adjust separators
      opts.options = opts.options or {} -- Ensure options table exists
      opts.sections = opts.sections or {} -- Ensure sections table exists

      opts.options.component_separators = { left = "", right = "" } -- Vertical slashes or similar
      opts.options.section_separators = { left = "", right = "" } -- Rounded corners

      -- Example of how to add a "theme" or customize colors if needed
      -- You might need to adjust these based on your colorscheme
      -- For demonstration, let's set a simple theme.
      -- LazyVim usually handles colors via your colorscheme automatically.
      -- If you want specific colors for lualine, you can define them here.
      -- opts.options.theme = {
      --   normal = {
      --     c = { fg = "#abb2bf", bg = "#282c34" } -- Example fg/bg
      --   },
      --   inactive = {
      --     c = { fg = "#5c6370", bg = "#21252b" }
      --   }
      -- }

      -- You can also re-arrange sections or add/remove components
      -- This is LazyVim's default structure, you can modify it:
      -- opts.sections.lualine_a = { "mode" }
      -- opts.sections.lualine_b = { "branch" }
      -- opts.sections.lualine_c = {
      --   LazyVim.lualine.root_dir(),
      --   { "diagnostics", symbols = { error = "󰅖", warn = " warning" } },
      --   { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      --   { LazyVim.lualine.pretty_path() },
      -- }
      -- opts.sections.lualine_x = { "encoding", "fileformat", "filetype" }
      -- opts.sections.lualine_y = { "progress" }
      -- opts.sections.lualine_z = { "location" }

      return opts
    end,
  },
}
