-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- colorscheme and UI
  {
    "EdenEast/nightfox.nvim", -- theme nordfox
    lazy = false,
    priority = 1000,
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },
  "nvim-lualine/lualine.nvim", -- statusline
  "lewis6991/gitsigns.nvim",

  -- helpers
  "windwp/nvim-autopairs",
  "numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
  "folke/which-key.nvim", -- ":WhichKey"

  -- LSP
  "neovim/nvim-lspconfig", -- lsp
  "onsails/lspkind-nvim", -- vscode-like pictograms
  "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in lsp
  "hrsh7th/cmp-cmdline", -- nvim-cmp source for command
  "hrsh7th/cmp-nvim-lua", -- nvim lua runtime API completion
  "hrsh7th/cmp-path", -- nvim-cmp source for path
  "hrsh7th/nvim-cmp", -- completion
  "L3MON4D3/LuaSnip", -- snippet

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  "p00f/clangd_extensions.nvim", -- more from clangd

  -- diagnostics and formatting
  "folke/trouble.nvim", -- list for showing diagnostics and others
  "stevearc/conform.nvim", -- formatter

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
  "nvim-telescope/telescope-file-browser.nvim",

  "stevearc/aerial.nvim",
}

local opts = {}

require("lazy").setup(plugins, opts)
