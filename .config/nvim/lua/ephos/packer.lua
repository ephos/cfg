-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- If you aint' fuzzy finding you're already lost
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Gimme them sweet sweet colors!
    use('folke/tokyonight.nvim')

    -- Tree Sitter for that need to have AST
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    -- Gotta have the lightline baby!
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- I get lost without my vertical lines
    use "lukas-reineke/indent-blankline.nvim"

    -- Golang Lang
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua' -- recommanded if need floating window support
    use 'neovim/nvim-lspconfig'

    -- Find them bugs
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use 'theHamsta/nvim-dap-virtual-text'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -- LSP, autocomplete is life
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }


    --LSP Support, LSP you autocomplete me!
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    --Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- Don't cut yourself on this C#
    -- Also make sure to install this (https://github.com/OmniSharp/omnisharp-roslyn)
    --use 'OmniSharp/omnisharp-vim'

    -- I know I should use netrw, but I want fancy icons
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly'                    -- optional, updated every week. (see issue #1193)
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

    -- Cheat codez
    use 'github/copilot.vim'

    -- Don't get cut on that sharp letter C
    use 'OmniSharp/omnisharp-vim'

    -- Makin' Gamez (maybe)
    use 'habamax/vim-godot'

    -- Make that markdown glow!
    use 'ellisonleao/glow.nvim'
end)
