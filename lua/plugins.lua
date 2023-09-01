--[[
-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- Regenerate compiled loader file
:PackerCompile

-- Remove any disabled or unused plugins
:PackerClean

-- Clean, then install missing plugins
:PackerInstall

-- Clean, then update and install plugins
-- supports the `--preview` flag as an optional first argument to preview updates
:PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
-- supports the `--preview` flag as an optional first argument to preview updates
:PackerSync

-- Show list of installed plugins
:PackerStatus

-- Loads opt plugin immediately
:PackerLoad completion-nvim ale
]]--


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- https://github.com/wbthomason/packer.nvim

  -- color scheme/theme
  -- use 'morhetz/gruvbox'
  -- use 'arcticicestudio/nord-vim'
  -- use 'sainnhe/sonokai'
  -- use 'ayu-theme/ayu-vim'
  use 'tomasiser/vim-code-dark'

  -- Intellisense engine
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'

  -- for easy surround
  use 'tpope/vim-surround'

  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- telescope file browser
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
  -- icons for file browser
  use 'nvim-tree/nvim-web-devicons'

  -- tree-sitting
  use 'nvim-treesitter/nvim-treesitter'

  -- terminals
  use 'voldikss/vim-floaterm'

  -- winhist plugin
  use('b63/win-hist')
end)
