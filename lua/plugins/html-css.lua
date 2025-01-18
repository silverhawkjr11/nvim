return {
  "Jezda1337/nvim-html-css",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  event = "InsertEnter", -- This will delay loading until insert mode
  -- Or use ft to load only for relevant filetypes
  -- ft = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
}
