return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
    config = function()
      require("telescope").load_extension("aerial")
      require("telescope").load_extension("file_browser")
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
      pcall(require("telescope").load_extension, "fzf")
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
}
