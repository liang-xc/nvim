vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'EdenEast/nightfox.nvim' -- theme nordfox
  use 'nvim-lualine/lualine.nvim' -- statusline
  use 'neovim/nvim-lspconfig' -- lsp
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in lsp
  use 'hrsh7th/cmp-cmdline' -- nvim-cmp source for command
  use 'hrsh7th/nvim-cmp' -- completion
  use 'L3MON4D3/LuaSnip' -- snippet
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'windwp/nvim-autopairs'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }
  use "lewis6991/gitsigns.nvim"
  use "p00f/clangd_extensions.nvim"
end)
