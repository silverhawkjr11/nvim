return {
  "ThePrimeagen/refactoring.nvim",
  depends = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup()
  end,
}
