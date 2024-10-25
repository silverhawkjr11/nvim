return {
  "xiyaowong/nvim-transparent",
  config = function()
    require("transparent").setup({
      enable = true,
      extra_groups = {
        "TelescopePrompt",
        "TelescopeResults",
        "TelescopePreview",
        "qf",
        "lir_dir",
        "lir_symlink_dir",
        "lir_marked_dir",
        "lir_marked_file",
      },
      exclude = {},
    })
  end,
}
