-- Auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Preferred colorschemes
  use("bluz71/vim-nightfly-guicolors")

  -- Telescope for fuzzy finder
  -- Dependency for better sorting performance
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use {
	  "nvim-telescope/telescope.nvim", tag = "0.1.0",
	  requires = { {"nvim-lua/plenary.nvim"} }
  }

  -- Treesitter for highlighting
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end
  }
  use("nvim-treesitter/nvim-treesitter-context");

  -- A pretty list for showing diagnostics, references, 
  -- telescope results, quickfix and location lists 
  -- to help you solve all the trouble your code is causing.
  use({
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        icons = false,
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  })

  -- Undotree for better undo history
  use("mbbill/undotree")

  -- Fugitive for Git
  use("tpope/vim-fugitive")

  -- Harpoon for better navigation
  use("theprimeagen/harpoon")

  -- Comment with gc
  use("numToStr/Comment.nvim")

  -- Lualine for statusline
  use("nvim-lualine/lualine.nvim")

  -- LSP is Language Server Protocol
  -- linting, autocompletion, etc.
  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      -- LSP Support
      {"neovim/nvim-lspconfig"},             -- Required
      {                                      -- Optional
      "williamboman/mason.nvim",
      run = function()
        pcall(vim.cmd, "MasonUpdate")
      end,
    },
    {"williamboman/mason-lspconfig.nvim"}, -- Optional

    -- Autocompletion
    {"hrsh7th/nvim-cmp"},
    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-path"},
    {"saadparwaiz1/cmp_luasnip"},
    {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/cmp-nvim-lua"},

    -- Snippets
    {"L3MON4D3/LuaSnip"},
    {"rafamadriz/friendly-snippets"},
  }
}

-- use("theprimeagen/refactoring.nvim")
-- use("folke/zen-mode.nvim")
-- use("eandrju/cellular-automaton.nvim")
-- use("laytan/cloak.nvim")

if packer_bootstrap then
  require("packer").sync()
end

end)
