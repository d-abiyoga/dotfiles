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
  -- Colorscheme
  use "rktjmp/lush.nvim"
  use "morhetz/gruvbox"
  use "sainnhe/gruvbox-material"

  -- Editing enhancements and tools
  -- autopairs


  -- LSP + syntax
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lspconfig')
    end,
  }
  use 'williamboman/nvim-lsp-installer'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = { ':TSUpdate' }
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.completion')
    end
  }
  use {
    'glepnir/lspsaga.nvim',
    config = function()
      require('plugins.lspsaga')
    end,
  }

  -- UI + utils
  use { 'lukas-reineke/indent-blankline.nvim'}
  use { 'kyazdani42/nvim-web-devicons' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require'lualine'.setup {
          options = {
            theme = 'gruvbox-material'
          }
        }
    end,
  }
  use {
    'kyazdani42/nvim-tree.lua' ,
    module = 'nvim-tree',
    config = function() require'nvim-tree'.setup {} end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugins.telescope').setup()
    end
  }

end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border= 'single' })
    end
  }
}})
