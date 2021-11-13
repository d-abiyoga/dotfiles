local present, packer = pcall(require, "plugins.packerInit")

if not present then 
  return false
end

local use = packer.use

return packer.startup({function(use)
  -- Packer
  use {
    'wbthomason/packer.nvim',
    event = 'VimEnter',
  }
  -- Editing enhancements and tools
  -- autopairs


  -- LSP + syntax
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use { 
    'nvim-treesitter/nvim-treesitter',
    run = { ':TSUpdate' }
  }


  -- UI + utils
  use { 'lukas-reineke/indent-blankline.nvim'}
  use { 'kyazdani42/nvim-web-devicons' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true}
  }
  use { 
    'kyazdani42/nvim-tree.lua' ,
    module = 'nvim-tree',
    setup = function() require('nvim-tree').setup() end,
    config = function() require('nvim-tree').setup() end,
    wants = { 'nvim-web-devicons' },
  }
  
  use { 
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border= 'single' })
    end
  }
}})
