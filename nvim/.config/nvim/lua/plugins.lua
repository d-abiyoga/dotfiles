local present, packer = pcall(require, "plugins.packerInit")

if not present then 
  return false
end

local use = packer.use

return packer.startup({function()
  -- Packer
  use {
    'wbthomason/packer.nvim',
    event = 'VimEnter',
    opt = true
  }

  -- Theme
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        -- Options (see available options below)
        vim.g.rose_pine_variant = 'moon'
        vim.g.pine_disable_background = true

        -- Load colorscheme after options
        vim.cmd('colorscheme rose-pine')
    end
  })

  -- Editing enhancements and tools
  -- autopairs


  -- LSP + syntax
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use { 
    'nvim-treesitter/nvim-treesitter',
    run = { ':TSUpdate' }
  }

  -- Completion
  use { 
    'hrsh7th/nvim-compe',
    config = function() require 'plugins.compe' end,
    disable = true
  }
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'

  use 'saadparwaiz1/cmp_luasnip'
  use 'onsails/lspkind-nvim'
  
  -- UI + utils
  use { 
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead'
  }

  use { 'kyazdani42/nvim-web-devicons' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require 'plugins.lualine' end,
  }
 
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('plugins.nvim-tree').config() end,
    setup = function() require('plugins.nvim-tree').setup() end,
    wants = 'kyazdani42/nvim-web-devicons',
  }

  use { 
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  
  use {'glepnir/dashboard-nvim',
    config = [[require('plugins.dashboard')]] 
  }

  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {} 
    end,
    disable = true
  }

  
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border= 'single' })
    end
  }
}})
