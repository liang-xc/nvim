return {
  -- helpers
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
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

      -- Move cursor to the beginning of the nexet line after comment
      post_hook = function(ctx)
        local r = table.unpack(vim.api.nvim_win_get_cursor(0))
        local rcnt = vim.api.nvim_buf_line_count(0)
        if rcnt > r then
          vim.api.nvim_win_set_cursor(0, { r + 1, 0 })
        end
      end,
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
  {
    "mbbill/undotree",
  },

  -- diagnostics, linting and formatting
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
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
