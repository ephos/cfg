-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- If you aint' fuzzy finding you're already lost
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Gimme them sweet sweet colors!
  use('folke/tokyonight.nvim')

  -- Tree Sitter for that need to have AST
  use( 'nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
  use( 'nvim-treesitter/playground' )

  -- Gotta have the lightline baby!
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Golang Lang
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommanded if need floating window support
  use 'neovim/nvim-lspconfig'

  -- Find them bugs
  use 'mfussenegger/nvim-dap'
  use 'leoluz/nvim-dap-go'
  use 'theHamsta/nvim-dap-virtual-text'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  -- LSP, autocomplete is life
  use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
      }
  }

  -- The colors Duke, the colors!!!
  use('norcalli/nvim-colorizer.lua')

  -- Show me where I messed up
  use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
  }

  -- Show me where other people messed up
  use 'lewis6991/gitsigns.nvim'

  -- Fancy icons
  use 'nvim-tree/nvim-web-devicons'

  -- Make a list and check it twice (for markdown)
  use 'dkarter/bullets.vim'

  -- Brackets need a partner, they are happier that way
  use 'windwp/nvim-autopairs'

  -- Minimap show me the way
  use 'wfxr/minimap.vim'

end)
