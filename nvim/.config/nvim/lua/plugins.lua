-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Bootstrap
-- local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
-- end

-- Protected call so we don't error first use
local present, packer = pcall(require, "plugins.packerInit")
if not present then
    return false
end

local use = packer.use

return packer.startup({
    function()
        -- Packer
        use({
            "wbthomason/packer.nvim",
            event = "VimEnter",
        })
        use("nvim-lua/plenary.nvim")
        -- Colorscheme
        use("rktjmp/lush.nvim")
        use("morhetz/gruvbox")
        use("sainnhe/gruvbox-material")
        use("folke/tokyonight.nvim")

        -- Editing enhancements and tools
        -- autopairs
        use({
            "windwp/nvim-autopairs",
            config = function()
                require("plugins.autopairs")
            end,
        })
        use({
            "numToStr/Comment.nvim",
            config = function()
                require("plugins.comment")
            end,
        })
        use("JoosepAlviste/nvim-ts-context-commentstring")

        -- LSP + syntax
        ---[[
        use("hrsh7th/cmp-nvim-lsp")
        use("hrsh7th/cmp-buffer")
        use("hrsh7th/cmp-path")
        use("hrsh7th/cmp-cmdline")
        use({
            "hrsh7th/nvim-cmp",
            --config = function() require('plugins.cmp') end
        })
        use("L3MON4D3/LuaSnip")
        use("rafamadriz/friendly-snippets")
        use("saadparwaiz1/cmp_luasnip")
        --]]
        use({
            "neovim/nvim-lspconfig",
            --[[
    config = function()
      require('plugins/lspconfig')
    end,
  --]]
        })
        use("williamboman/nvim-lsp-installer")
        use({
            "nvim-treesitter/nvim-treesitter",
            run = { ":TSUpdate" },
            config = function()
                require("plugins.treesitter")
            end,
        })
        use("p00f/nvim-ts-rainbow")
        use({
            "tami5/lspsaga.nvim",
            config = function()
                require("plugins.lspsaga")
            end,
        })
        -- use 'onsails/lspkind-nvim'
        use("mattn/emmet-vim")

        --formatter
        -- use {
        --   'prettier/vim-prettier',
        --   run = 'yarn install',
        --   ft = {'javascript', 'html', 'css'},
        -- }
        use("jose-elias-alvarez/null-ls.nvim")

        -- UI + utils
        use({
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            --[[ config = function()
                require("plugins.indent-blankline")
            end, ]]
        })
        use({ "kyazdani42/nvim-web-devicons" })
        use({
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
            config = function()
                require("lualine").setup({
                    options = {
                        theme = "tokyonight",
                    },
                })
            end,
        })
        use({
            "kyazdani42/nvim-tree.lua",
            module = "nvim-tree",
            config = function()
                require("plugins.nvim-tree")
            end,
        })
        use({
            "akinsho/bufferline.nvim",
            config = function()
                require("plugins.bufferline")
            end,
        })
        use("moll/vim-bbye")

        use({
            "nvim-telescope/telescope.nvim",
            config = function()
                require("plugins.telescope")
            end,
        })
        use("nvim-telescope/telescope-media-files.nvim")

        use({
            "glepnir/dashboard-nvim",
            setup = function()
                require("plugins.dashboard")
            end,
        })
        use({
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup()
            end,
        })

        use({
            "lewis6991/gitsigns.nvim",
            config = function()
                require("plugins.gitsigns")
            end,
        })

        use({
            "akinsho/toggleterm.nvim",
            config = function()
                require("plugins.toggleterm")
            end,
        })

        use("fatih/vim-go")
        use("tpope/vim-fugitive")
        use { "folke/todo-comments.nvim",
            require = "nvim-lua/'plenary.nvim",
            config = function()
                require("todo-comments").setup {

                }
            end
        }
        -- if PACKER_BOOTSTRAP then
        --   require('packer').sync()
        -- end
    end,
})
