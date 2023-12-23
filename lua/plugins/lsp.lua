return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
      require("neodev").setup()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local lspconfig = require("lspconfig")

      -- lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })

      -- python
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          pyright = {
            autoImportCompletion = true,
          },
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
              useLibraryCodeForTypes = true,
              typeCheckingMode = "off",
            },
          },
        },
      })

      -- c++
      lspconfig.clangd.setup({ capabilities = capabilities })

      -- cmake
      lspconfig.cmake.setup({ capabilities = capabilities })

      --ocaml
      lspconfig.ocamllsp.setup({ capabilities = capabilities })

      -- Standard ML
      lspconfig.millet.setup({ capabilities = capabilities })

      -- Rust
      lspconfig.rust_analyzer.setup({ capabilities = capabilities })

      -- Powershell
      lspconfig.powershell_es.setup({ capabilities = capabilities })
    end,
  },
}
