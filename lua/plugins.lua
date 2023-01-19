vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- colorscheme and UI
  use 'EdenEast/nightfox.nvim' -- theme nordfox
  use 'nvim-lualine/lualine.nvim' -- statusline
  use "lewis6991/gitsigns.nvim"

  -- helpers
  use 'windwp/nvim-autopairs'
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'folke/which-key.nvim' -- ":WhichKey"

  -- LSP
  use 'neovim/nvim-lspconfig' -- lsp
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in lsp
  use 'hrsh7th/cmp-cmdline' -- nvim-cmp source for command
  use 'hrsh7th/cmp-nvim-lua' -- nvim lua runtime API completion
  use 'hrsh7th/cmp-path' -- nvim-cmp source for path
  use 'hrsh7th/nvim-cmp' -- completion
  use 'L3MON4D3/LuaSnip' -- snippet

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }

  use "p00f/clangd_extensions.nvim" -- more from clangd

  -- diagnostics and formatting
  use "jose-elias-alvarez/null-ls.nvim"

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'
end)
