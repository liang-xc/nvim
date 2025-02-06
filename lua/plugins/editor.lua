return {
  -- helpers
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      disable_filetype = { "TelescopePrompt", "spectre_panel", "vim", "fsharp", "ocaml" },
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    lazy = true,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },
  {
    "mbbill/undotree",
    lazy = true,
  },

  -- diagnostics, linting and formatting
  {
    "stevearc/conform.nvim",
    event = "InsertEnter",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        ocaml = { "ocamlformat" },
        python = { "ruff_format" },
      },
      format_on_save = function(bufnr)
        local ignore_filetypes = { "python" }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
    },
  },
}
