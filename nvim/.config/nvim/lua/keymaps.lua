-- Mappings
local U = require("utils")
local map = U.map
-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Open a Quickfix window for the last search.
map("n", "<leader>?", ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>")

-- Split window
map("n", "vv", "<C-w>v")
map("n", "ss", "<C-w>s")

-- Alternate way to save
map("n", "<leader>w", ":write<CR>")
map("n", "<C-s>", ":write<CR>")

-- Alternative way to quit with saving
map("n", "<C-q>", ":wq!<cr>")

-- Better window movement
-- map('n', '<C-h>', '<C-w>h')
-- map('n', '<C-j>', '<C-w>j')
-- map('n', '<C-k>', '<C-w>k')
-- map('n', '<C-l>', '<C-w>l')

-- Better window resize
map("n", "<C-Up>", ":resize -2<cr>")
map("n", "<C-Down>", ":resize +2<cr>")
map("n", "<C-Right>", ":vertical-resize -2<cr>")
map("n", "<C-Left>", ":vertical-resize +2<cr>")

-- Quick open newtr
-- map('n', '<leader>pv', ':wincmd v<bar> :Ex <bar> :vertical resize 30<CR>')

-- yank to the eol
map("n", "Y", "yg_")

-- keep focus on center
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Better vertical movement
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- Moving Text
map("v", "J", ":m '>+1<CR>gv=gv") --TODO: should it in x or v mode?
map("v", "K", ":m '<-2<CR>gv=gv") --TODO: should it in x or v mode?
--map("x", "J", ":m '>+1<CR>gv-gv'") --TODO: should it in x or v mode?
--map("x", "K", ":m '<-2<CR>gv-gv'") --TODO: should it in x or v mode?
map("i", "<C-k>", "<esc>:m .-2<CR>==")
map("i", "<C-j>", "<esc>:m .+1<CR>==")
map("n", "<m-j>", ":m .+1<CR>==")
map("n", "<m-k>", ":m .-2<CR>==")

-- Clear highlight
map("n", "<leader>h", ":noh<cr>:call clearmatches()<cr>")

-- Select all
--[[ map("n", "<C-a>", "ggVG") ]]

-- Escape
map("i", "jk", "<esc>")
map("i", "kj", "<esc>")
map("i", "jj", "<esc>")

-- Better Indent (stay in visual mode during indenting)
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Open file in its default app
map("n", "<leader>x", "<cmd>!xdg-open %<cr><cr>")

-- formatting for jsonls
--nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})<CR>
map("n", "<leader>F", "<cmd>lua vim.lsp.range_formatting({},{0,0},{vim.fn.line('$'),0})<cr>")

-- git
map("n", "<leader>ng", "<cmd>Neogit<cr>")
map("n", "<leader>gb", "<cmd>Git blame<cr>")

-- Navigate buffer
map("n", "<S-l>", ":bnext<cr>")
map("n", "<S-h>", ":bprevious<cr>")

-- ===PLUGINS===
-- File explorer
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
--
--[[ map("n", "<leader>e", "<cmd>NeoTreeFocusToggle<cr>") ]]

-- LSP
--[[ map("n", "K", "<cmd>Lspsaga hover_doc<cr>") ]]
--[[ map("i", "<C-k>", "<cmd>Lspsaga hover_doc<cr>") ]]
--[[ map("n", "gh", "<cmd>Lspsaga lsp_finder<cr>") ]]
--[[ map("n", "<C-e>", "<cmd>Lspsaga show_line_diagnostics<CR>") ]]

-- Telescope
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fm", "<cmd>Telescope media_files<cr>")
map("n", "<leader>ft", ":TodoTelescope<cr>")

-- GoLang
map("n", "<leader>lgt", ":GoTest<CR>")
map("n", "<leader>lgr", ":GoRun<CR>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Quickfix list
--
map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

-- Git
map("n", "<leader>gn", "<cmd>Gitsigns next_hunk<CR>")
map("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<CR>")
map("n", "<leader>gs", "<cmd>Gitsigns preview_hunk<CR>")
