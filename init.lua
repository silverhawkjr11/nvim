-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Enable line wrapping and breaking at word boundaries
vim.o.wrap = true
vim.o.linebreak = true

-- Optional: Add a visible marker for wrapped lines
vim.o.showbreak = "↪ " -- You can replace ↪ with any symbol or string

-- Enable 24-bit colors and set colorscheme
vim.o.termguicolors = true
vim.cmd("colorscheme catppuccin")
