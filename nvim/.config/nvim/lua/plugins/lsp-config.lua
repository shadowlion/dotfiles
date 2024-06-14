return {
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.on_attach(function(_, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      require('mason').setup({
        ensure_installed = {
          "mypy",
          "black",
          "isort",
        },
      })

      require('mason-lspconfig').setup({
        lazy = false,
        opts = {
          auto_install = true,
        },
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "gopls",
          "golangci_lint_ls",
          "ruff_lsp",
          "pyright",
          "rust_analyzer",
        },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        },
      })
    end,
  },
}
