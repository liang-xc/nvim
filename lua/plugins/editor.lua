return {
  -- helpers
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      -- LHS of toggle mappings in NORMAL mode
      toggler = {
        -- Line-comment toggle keymap
        line = "<space>cc",
        -- Block-comment toggle keymap
        block = "<space>cb",
      },
      -- LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        -- Line-comment keymap
        line = "<space>c",
        -- Block-comment keymap
        block = "<space>b",
      },
      -- LHS of extra mappings
      extra = {
        -- Add comment on the line above
        above = "<space>cO",
        -- Add comment on the line below
        below = "<space>co",
        -- Add comment at the end of line
        eol = "<space>cA",
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },

  -- diagnostics, linting and formatting
  {
    "stevearc/conform.nvim",
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
