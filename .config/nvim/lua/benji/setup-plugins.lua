-- Auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

-- true if packer was just installed
local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Import packer safely
local status, packer = pcall(require, 'packer')
if not status then
  return
end

return packer.startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  use('tpope/vim-fugitive')
  use('tpope/vim-rhubarb')

  -- Detect tabstop and shiftwidth automatically
  use('tpope/vim-sleuth')

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  -- LSP Configuration & Plugins
  use({
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      {
        'williamboman/mason.nvim',
        run = ':MasonUpdate'
      },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
      },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  })

  -- Autocompletion
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  })

  -- Useful plugin to show you pending keybinds.
  use({ 'folke/which-key.nvim', opts = {} })

  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  -- See `:help gitsigns.txt`
  use('lewis6991/gitsigns.nvim')

  -- Theme inspired by Atom
  -- use({
  --   'navarasu/onedark.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'onedark'
  --   end,
  -- })

  -- Preferred colorschemes
  use('bluz71/vim-nightfly-guicolors')

  -- Set lualine as statusline
  -- See `:help lualine.txt`
  use('nvim-lualine/lualine.nvim')

  -- Add indentation guides even on blank lines
  -- See `:help indent_blankline.txt`
  use('lukas-reineke/indent-blankline.nvim')

  -- 'gc' to comment visual regions/lines
  use('numToStr/Comment.nvim')

  -- Fuzzy Finder (files, lsp, etc)
  -- See `:help telescope` and `:help telescope.setup()`
  use({
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  })

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  use({
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  })

  -- Highlight, edit, and navigate code
  -- See `:help nvim-treesitter`
  use({
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      -- 'nvim-treesitter/nvim-treesitter-context',
    },
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  })
  -- use('nvim-treesitter/nvim-treesitter-context')

  -- A pretty list for showing diagnostics, references,
  -- telescope results, quickfix and location lists
  -- to help you solve all the trouble your code is causing.
  use('folke/trouble.nvim')

  -- Undotree for better undo history
  use('mbbill/undotree')

  -- Wakatime
  use('wakatime/vim-wakatime')

  -- ThePrimeagen's navigation plugin
  use('theprimeagen/harpoon')

  -- Autopairs, autoclose and autorename HTML tags with treesitter
  use('windwp/nvim-autopairs')
  use('windwp/nvim-ts-autotag')

  -- Bufferline for tabs
  use('akinsho/nvim-bufferline.lua')

  -- Distraction-free coding
  use('folke/zen-mode.nvim')

  -- Svelte syntax highlight
  use({
    'evanleck/vim-svelte',
    branch = 'main',
    requires = {
      {
        'othree/html5.vim',
        'pangloss/vim-javascript',
      },
    },
  })

  -- ThePrimeagen's game
  use('theprimeagen/vim-be-good')

  if packer_bootstrap then
    require('packer').sync()
  end
end)
