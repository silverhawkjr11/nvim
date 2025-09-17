return {
  -- Pick a working colorscheme you actually have installed
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin-mocha" } },

  -- (Optional) Ensure the theme plugin is present
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}
