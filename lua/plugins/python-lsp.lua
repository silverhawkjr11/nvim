-- python-lsp.lua
return {
  -- Make sure the tools are installed
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "basedpyright", -- Python LSP (fast, types)
        "ruff", -- Ruff language server (lint, quickfixes)
        "jedi-language-server", -- optional; sometimes better for Django magic
      })
    end,
  },

  -- Configure LSP servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "standard",
                autoImportCompletions = true,
              },
            },
          },
        },
        ruff = {}, -- for diagnostics/quickfix; not for gd()
        -- Uncomment if Django “magic” doesn’t jump well with basedpyright:
        -- jedi_language_server = {},
      },
      setup = {
        basedpyright = function(_, opts)
          local lspconfig = require("lspconfig")
          local util = require("lspconfig.util")
          -- Good project roots for Django repos
          opts.root_dir = util.root_pattern("pyrightconfig.json", "pyproject.toml", "setup.cfg", "manage.py", ".git")
          lspconfig.basedpyright.setup(opts)
          return true
        end,
      },
    },
  },
}
