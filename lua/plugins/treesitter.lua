return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
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
        disable = { "ocaml" },
      },
      ensure_installed = {
        "cmake",
        "comment",
        "cpp",
        "lua",
        "ocaml",
        "python",
        "rust",
        "sql",
        "yaml",
      },
    })
  end,
}
