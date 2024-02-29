return {
  { "ionide/Ionide-vim" },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("neodev").setup()
      local lspconfig = require("lspconfig")
      -- cmp lsp capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "azure_pipelines_ls",
          "cmake",
          "jsonls",
          "lemminx", -- xml
          "lua_ls",
          "pyright",
          "powershell_es",
          "ruff_lsp", -- python linter
          "rust_analyzer",
          "yamlls",
        },
        handlers = {
          function(server_name) -- default handler
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                  completion = {
                    callSnippet = "Replace",
                  },
                },
              },
            })
          end,
          ["pyright"] = function()
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
                    typeCheckingMode = "standard",
                  },
                },
              },
            })
          end,
          ["ruff_lsp"] = function()
            lspconfig.ruff_lsp.setup({
              on_attach = function(client)
                client.server_capabilities.hoverProvider = false
              end,
            })
          end,
        },
      })

      -- lsp that are not installed through Mason
      -- Install these separately
      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.ocamllsp.setup({ capabilities = capabilities })
      -- require("ionide").setup({ capabilities = capabilities })
    end,
  },
  {
    "p00f/clangd_extensions.nvim",
    opts = {
      ast = {
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },

        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
      },
    },
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
}
