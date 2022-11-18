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
            config = function()
                require("lspconfig").astro.setup({})
            end,
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
        use("nvim-treesitter/nvim-treesitter-context")
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
        -- use({
        --     "akinsho/bufferline.nvim",
        --     config = function()
        --         require("plugins.bufferline")
        --     end,
        -- })
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
        use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
        use("TimUntersberger/neogit")
        --[[ use({ "ten3roberts/neogit", branch = "git-escapes" }) ]]
        use({
            "folke/todo-comments.nvim",
            require = "nvim-lua/'plenary.nvim",
            config = function()
                require("todo-comments").setup({
                    {
                        signs = true, -- show icons in the signs column
                        sign_priority = 8, -- sign priority
                        -- keywords recognized as todo comments
                        keywords = {
                            FIX = {
                                icon = " ", -- icon used for the sign, and in search results
                                color = "error", -- can be a hex color, or a named color (see below)
                                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                                -- signs = false, -- configure signs for some keywords individually
                            },
                            TODO = { icon = " ", color = "info" },
                            HACK = { icon = " ", color = "warning" },
                            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                            PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                            NOTE = { icon = " ", color = "hint", alt = { "INFO", "TODISCUSS" } },
                        },
                        merge_keywords = true, -- when true, custom keywords will be merged with the defaults
                        -- highlighting of the line containing the todo comment
                        -- * before: highlights before the keyword (typically comment characters)
                        -- * keyword: highlights of the keyword
                        -- * after: highlights after the keyword (todo text)
                        highlight = {
                            before = "", -- "fg" or "bg" or empty
                            keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
                            after = "fg", -- "fg" or "bg" or empty
                            pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
                            comments_only = true, -- uses treesitter to match keywords in comments only
                            max_line_len = 400, -- ignore lines longer than this
                            exclude = {}, -- list of file types to exclude highlighting
                        },
                        -- list of named colors where we try to extract the guifg from the
                        -- list of hilight groups or use the hex color if hl not found as a fallback
                        colors = {
                            error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                            warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
                            info = { "DiagnosticInfo", "#2563EB" },
                            hint = { "DiagnosticHint", "#10B981" },
                            default = { "Identifier", "#7C3AED" },
                        },
                        search = {
                            command = "rg",
                            args = {
                                "--color=never",
                                "--no-heading",
                                "--with-filename",
                                "--line-number",
                                "--column",
                            },
                            -- regex that will be used to match keywords.
                            -- don't replace the (KEYWORDS) placeholder
                            pattern = [[\b(KEYWORDS):]], -- ripgrep regex
                            -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
                        },
                    },
                })
            end,
        })
        use({
            "mfussenegger/nvim-dap",
            config = function()
                require("plugins.debugger")
            end,
        })
        use("leoluz/nvim-dap-go")
        use("rcarriga/nvim-dap-ui")
        use("theHamsta/nvim-dap-virtual-text")
        use("nvim-telescope/telescope-dap.nvim")

        use("nathangrigg/vim-beancount")
        -- if PACKER_BOOTSTRAP then
        --   require('packer').sync()
        -- end
    end,
})
