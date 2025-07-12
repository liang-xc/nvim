return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
          },
        },
      },
      extensions = {
        aerial = {
          show_nesting = {
            ["_"] = false,
          },
        },
        file_browser = {
          theme = "ivy",
          hijack_netrw = true,
        },
      },
    })
    pcall(require("telescope").load_extension, "aerial")
    pcall(require("telescope").load_extension, "file_browser")
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
  end,
}
