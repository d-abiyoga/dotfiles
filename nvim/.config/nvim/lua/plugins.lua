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
        use("catppuccin/nvim")
        use("rebelot/kanagawa.nvim")
        use("navarasu/onedark.nvim")
        use("sainnhe/everforest")

        -- Editing enhancements and tools
        -- autopairs
        use("windwp/nvim-autopairs")
        use("numToStr/Comment.nvim")
        use("JoosepAlviste/nvim-ts-context-commentstring")

        -- LSP + syntax
        use({
            "VonHeikemen/lsp-zero.nvim",
            requires = {
                -- LSP Support
                { "neovim/nvim-lspconfig" },
                { "williamboman/mason.nvim" },
                { "williamboman/mason-lspconfig.nvim" },

                -- Autocompletion
                { "hrsh7th/nvim-cmp" },
                { "hrsh7th/cmp-buffer" },
                { "hrsh7th/cmp-path" },
                { "saadparwaiz1/cmp_luasnip" },
                { "hrsh7th/cmp-nvim-lsp" },
                { "hrsh7th/cmp-nvim-lua" },

                -- Snippets
                { "L3MON4D3/LuaSnip" },
                { "rafamadriz/friendly-snippets" },
            },
        })
        ---[[
        use("hrsh7th/cmp-cmdline")
        use("tami5/lspsaga.nvim")

        -- TreeSitter
        use({
            "nvim-treesitter/nvim-treesitter",
            run = { ":TSUpdate" },
        })
        use("p00f/nvim-ts-rainbow")
        use("nvim-treesitter/nvim-treesitter-context")
        use("nvim-treesitter/playground")
        use("mattn/emmet-vim")

        --formatter
         use {
           'prettier/vim-prettier',
           run = 'yarn install',
           ft = {'javascript', 'typescript', 'html', 'css', 'typescriptreact'},
         }

        use("jose-elias-alvarez/null-ls.nvim")

        -- UI + utils
        use({
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
        })
        use({ "kyazdani42/nvim-web-devicons" })
        use({
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
        })
        use({
            "kyazdani42/nvim-tree.lua",
            module = "nvim-tree"
        })
        use("moll/vim-bbye")

        use("nvim-telescope/telescope.nvim")
        use("nvim-telescope/telescope-media-files.nvim")
        use{'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

        use("glepnir/dashboard-nvim")
        use({
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup()
            end,
        })

        use("lewis6991/gitsigns.nvim")

        use("akinsho/toggleterm.nvim")

        use("fatih/vim-go")
        use("tpope/vim-fugitive")
        use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
        use("TimUntersberger/neogit")
        use({
            "folke/todo-comments.nvim",
            require = "nvim-lua/'plenary.nvim",
        })

        -- DAP
        use("mfussenegger/nvim-dap")
        use("leoluz/nvim-dap-go")
        use("rcarriga/nvim-dap-ui")
        use("theHamsta/nvim-dap-virtual-text")
        --[[ use("nvim-telescope/telescope-dap.nvim") ]]

        use("folke/trouble.nvim")
        use("ThePrimeagen/harpoon")

        use("preservim/tagbar")
        use("nathangrigg/vim-beancount")
        use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
        })
        use("folke/zen-mode.nvim")
        use("folke/twilight.nvim")

        use("mickael-menu/zk-nvim")
        use({'jakewvincent/mkdnflow.nvim',
            --[[ rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed ]]
            config = function()
                require('mkdnflow').setup({})
            end
        })
        use {
          'phaazon/mind.nvim',
          branch = 'v2.2',
          requires = { 'nvim-lua/plenary.nvim' },
          config = function()
            require'mind'.setup()
          end
        }

    end,
})
