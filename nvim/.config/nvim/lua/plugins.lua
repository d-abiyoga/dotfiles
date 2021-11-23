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
  }
  -- Colorscheme
  use "rktjmp/lush.nvim"
  use "morhetz/gruvbox"
  use "sainnhe/gruvbox-material"

  -- Editing enhancements and tools
  -- autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require('nvim-autopairs').setup{} end
  }

  -- LSP + syntax
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use {
    'hrsh7th/nvim-cmp',
    config = function() require('plugins/completion') end
  }
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use {
    'neovim/nvim-lspconfig',
    --config = function()
    --  require('plugins/lspconfig')
    --end,
  }
  use 'williamboman/nvim-lsp-installer'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = { ':TSUpdate' }
  }
  use {
    'glepnir/lspsaga.nvim',
    config = function() require('plugins/lspsaga') end,
  }
  --use 'mattn/emmet-vim'
  --use 'JoosepAlviste/nvim-ts-context-commentstring'
  --use 'terrortylor/nvim-comment'
  --formatter

  -- UI + utils
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = "BufRead",
    config = function() require('plugins/indent-blankline') end,
  }
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
    config = function() require('plugins/telescope') end
  }
  use {
    'glepnir/dashboard-nvim',
    setup = function() require('plugins/dashboard') end
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  }

end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border= 'single' })
    end
  }
}})
