return {
  {
    "ojroques/nvim-osc52",
    lazy = false,
    config = function()
      require("osc52").setup({
        silent = false,
        max_length = 0,
      })

      -- Just copy on every yank, forget the clipboard provider
      vim.api.nvim_create_autocmd("TextYankPost", {
        group = vim.api.nvim_create_augroup("osc52_yank", { clear = true }),
        callback = function()
          if vim.v.event.operator == "y" then
            local text = table.concat(vim.v.event.regcontents, "\n")
            require("osc52").copy(text)
          end
        end,
      })
    end,
  },
}
