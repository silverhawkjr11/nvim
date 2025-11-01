return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    servers = {
      -- clangd configuration removed - handled by cpp.lua LazyVim extras
      dartls = {
        cmd = { "dart", "/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot", "--lsp" },
        filetypes = { "dart" },
        root_dir = require("lspconfig.util").root_pattern("pubspec.yaml"),
      },
      als = {
        cmd = { "als", "--stdio" },
        filetypes = { "als" },
        root_dir = require("lspconfig.util").root_pattern(".git"),
      },
      pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_dir = require("lspconfig.util").root_pattern(
          ".git",
          "setup.py",
          "setup.cfg",
          "pyproject.toml",
          "requirements.txt"
        ),
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
            },
          },
        },
      },
      -- Adding HTML and CSS Language Servers
      html = {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
        root_dir = require("lspconfig.util").root_pattern(".git", "index.html"),
      },
      cssls = {
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "less" },
        root_dir = require("lspconfig.util").root_pattern(".git", "index.html"),
      },
    },
  },
}
