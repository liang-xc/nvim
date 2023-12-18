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
    disable = {},
  },
  ensure_installed = {
    "cmake",
    "comment",
    "cpp",
    "lua",
    "ocaml",
    "ocaml_interface",
    "python",
    "rust",
    "sql",
    "yaml",
  },
})
