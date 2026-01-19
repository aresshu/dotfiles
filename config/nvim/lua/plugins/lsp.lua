local mason_opts = {
  ui = {
    border = "single",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

local capabilities = require('blink.cmp').get_lsp_capabilities()

local lsp_opts = {
  ensure_installed = {
    -- Languages
    "lua_ls",
    "ts_ls",
    "rust_analyzer",
    "clangd",
    "pyright",
    -- Frameworks
    "astro",
    "svelte",
    "cssls",
    -- DevOps
    "terraformls",
  },
  automatic_installation = true,
  handlers = {
    function (server_name)
      require("lspconfig")[server_name].setup{capabilities = capabilities}
    end,

    -- Lua
    ["lua_ls"] = function ()
      require("lspconfig").lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      }
    end,

    -- Rust
    ["rust_analyzer"] = function ()
      require("lspconfig").rust_analyzer.setup {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
            cargo = {
              allFeatures = true,
            },
          },
        },
      }
    end,

    -- C++
    ["clangd"] = function()
      require("lspconfig").clangd.setup {
        capabilities = capabilities,
      }
    end,
    
    -- Python
    ["pyright"] = function()
      require("lspconfig").pyright.setup {
        capabilities = capabilities,
      }
    end,

    -- Terraform
    ["terraformls"] = function()
      require("lspconfig").terraformls.setup{
        capabilities = capabilities,
      }
    end,

    -- Other Languages
  }
}

local function config()
  require("mason").setup(mason_opts)
  require("mason-lspconfig").setup(lsp_opts)
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },
  config = config
}
