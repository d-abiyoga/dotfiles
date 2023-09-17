-- Protected call so we don't error first use
--[[ local present, packer = pcall(require, "plugins.packerInit") ]]
--[[ if not present then ]]
--[[     return false ]]
--[[ end ]]

--[[ local use = packer.use ]]
--


-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local utils = require('utils')

require("lazy").setup {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = ":TSUpdate",
    },
    "nvim-treesitter/nvim-treesitter-context",
    {"nvim-treesitter/playground", event={"VeryLazy"}},

    -- auto-completion
    {
        "hrsh7th/nvim-cmp",
        event = "VeryLazy",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "saadparwaiz1/cmp_luasnip",
        },
        --[[ config = function()
            require("config.nvim-cmp")
        end, ]]

        {
            "VonHeikemen/lsp-zero.nvim",
            dependencies = {
                 "williamboman/mason.nvim" ,
                 "williamboman/mason-lspconfig.nvim" ,

                -- Autocompletion
                 "hrsh7th/nvim-cmp" ,
                 "hrsh7th/cmp-buffer" ,
                 "hrsh7th/cmp-path" ,
                 "saadparwaiz1/cmp_luasnip" ,
                 "hrsh7th/cmp-nvim-lsp" ,
                 "hrsh7th/cmp-nvim-lua" ,

                -- Snippets
                 "L3MON4D3/LuaSnip" ,
                 "rafamadriz/friendly-snippets" ,
            },
        },

        {
            "neovim/nvim-lspconfig" ,
            event = { 'BufRead', 'BufNewFile'},
        },

        "nvim-lua/plenary.nvim",
        "hrsh7th/cmp-cmdline",
        "tami5/lspsaga.nvim",

        -- Colorscheme
        {"rktjmp/lush.nvim", lazy=true},
        { "morhetz/gruvbox", lazy = true},
        { "sainnhe/gruvbox-material", lazy = true},
        { "folke/tokyonight.nvim", lazy = true},
        { "catppuccin/nvim", lazy = true},
        { "rebelot/kanagawa.nvim", lazy = true},
        { "navarasu/onedark.nvim", lazy = true},
        { "sainnhe/everforest", lazy = true},

        -- Editing enhancements and tools
        -- autopairs
        "windwp/nvim-autopairs",
        {"numToStr/Comment.nvim", event="VeryLazy"},
        {"JoosepAlviste/nvim-ts-context-commentstring", event="VeryLazy"},

        {"mattn/emmet-vim"},

        --formatter
        {
           'prettier/vim-prettier',
           run = 'yarn install',
           ft = {'javascript', 'typescript', 'html', 'css', 'typescriptreact'},
        },

        "jose-elias-alvarez/null-ls.nvim",
        "jose-elias-alvarez/typescript.nvim",

        -- UI + utils
        {
            "lukas-reineke/indent-blankline.nvim",
            event = "VeryLazy",
        },
        { "nvim-tree/nvim-web-devicons" , event = "VeryLazy"},
        {
            "nvim-lualine/lualine.nvim",
            event = "VeryLazy",
        },
        {
            "nvim-tree/nvim-tree.lua",
            module = "nvim-tree"
        },
        "moll/vim-bbye",

        "nvim-telescope/telescope.nvim",
        "nvim-telescope/telescope-media-files.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },

        --[[ { ]]
        --[[     'goolord/alpha-nvim', ]]
        --[[     dependencies = { 'nvim-tree/nvim-web-devicons' }, ]]
        --[[     config = function () ]]
        --[[         require'alpha'.setup(require'alpha.themes.startify'.config) ]]
        --[[     end ]]
        --[[ }, ]]

        {
           'glepnir/dashboard-nvim',
           event = 'VimEnter',
           --[[ config = function()
        --     require('dashboard').setup {
        --       -- config
        --     }
        --   end, ]]
           dependencies = { {'nvim-tree/nvim-web-devicons'}}
         },
        {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup()
            end,
        },

        "lewis6991/gitsigns.nvim",

        "akinsho/toggleterm.nvim",

        "fatih/vim-go",
        --[[ "buoto/gotests-vim", ]]
        {
          "yanskun/gotests.nvim",
          ft = "go",
          config = function()
            require("gotests").setup()
          end,
        },
        "tpope/vim-fugitive",
        {
            "sindrets/diffview.nvim",
            dependencies = "nvim-lua/plenary.nvim",
        },

        "NeogitOrg/neogit",
        {
            "folke/todo-comments.nvim",
            dependencies = "nvim-lua/plenary.nvim",
        },

        -- DAP
        {"mfussenegger/nvim-dap", event="VeryLazy"},
        {"leoluz/nvim-dap-go", event="VeryLazy"},
        {"rcarriga/nvim-dap-ui", event="VeryLazy"},
        {"theHamsta/nvim-dap-virtual-text", event="VeryLazy"},
        --[[ "nvim-telescope/telescope-dap.nvim") ]]

        "folke/trouble.nvim",
        "ThePrimeagen/harpoon",

        "preservim/tagbar",
        --
        "nathangrigg/vim-beancount",
        {
            "iamcco/markdown-preview.nvim",
            run = function() vim.fn["mkdp#util#install"]() end,
            event="BufRead"
        },
        {"folke/zen-mode.nvim", lazy=true},
        "folke/twilight.nvim",

        "mickael-menu/zk-nvim",
        {
            'jakewvincent/mkdnflow.nvim',
            --[[ rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed ]]
            config = function()
                require('mkdnflow').setup({})
            end,
            event="VeryLazy"
        },
        {
          'phaazon/mind.nvim',
          branch = 'v2.2',
          dependencies = { "nvim-lua/plenary.nvim" },
          config = function()
            require'mind'.setup()
          end,
          event = 'VeryLazy'
        },
        "mfussenegger/nvim-jdtls",
        {'windwp/nvim-ts-autotag', event="BufRead"},
        {
          "ray-x/lsp_signature.nvim",
          event = "BufRead",
          config = function() require"lsp_signature".on_attach() end,
        },

        {
            "liuchengxu/vista.vim",
            enabled = function()
            if utils.executable("ctags") then
                    return true
                else
                    return false
                end
            end,
            cmd = "Vista",
        },
    },

}
