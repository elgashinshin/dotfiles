return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
      window = {
        width = 120
      },
      plugins = {
        ["neo-tree"] = {
          enabled = true
        }
      }
    }
  end
}
