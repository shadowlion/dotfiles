require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"
local nvlsp = require "nvchad.configs.lspconfig"

if not configs.golangcilsp then
  configs.golangcilsp = {
    default_config = {
      cmd = { "golangci-lint-langserver" },
      root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
      init_options = {
        command = {
          "golangci-lint",
          "run",
          "--enable-all",
          "--disable",
          "lll",
          "--out-format",
          "json",
          "--issues-exit-code=1",
        },
      },
    },
  }
end

local servers = {
  html = {},
  gopls = {
    settings = {
      gopls = {
        gofumpt = true,
      },
    },
  },
  golangci_lint_ls = {
    filetypes = { "go", "gomod" },
  },
  vuels = {},
  ts_ls = {},
}

for name, opts in pairs(servers) do
  opts.on_attach = nvlsp.on_attach
  opts.on_init = nvlsp.on_init
  opts.capabilities = nvlsp.capabilities

  lspconfig[name].setup(opts)
end
