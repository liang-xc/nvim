return {
  { "nvim-treesitter/nvim-treesitter-textobjects", lazy = true },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        sync_install = false,
        auto_install = false,
        ignore_install = {},
        highlight = {
          enable = true,
          disable = {},
        },
        indent = {
          enable = true,
          disable = { "ocaml", "ocaml_interface" },
        },
        ensure_installed = {
          "bash",
          "cmake",
          "comment",
          "cpp",
          "css",
          "fsharp",
          "haskell",
          "html",
          "json",
          "lua",
          "make",
          "markdown",
          "markdown_inline",
          "menhir",
          "ocaml",
          "ocaml_interface",
          "proto",
          "python",
          "query",
          "rust",
          "sql",
          "vim",
          "vimdoc",
          "xml",
          "yaml",
        },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      max_lines = 3,
    },
  },
}
