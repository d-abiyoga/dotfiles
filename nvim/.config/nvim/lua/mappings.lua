-- Mappings
local U = require('utils')
local map = U.map
-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map('n', '<leader>w', ':write<CR>')

-- Open a Quickfix window for the last search.
map('n', "<leader>?", ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>")

-- Split window
map('n', 'vv', '<C-w>v')
map('n', 'ss', '<C-w>s')

-- quick open newtr
map('n', '<leader>pv', ':wincmd v<bar> :Ex <bar> :vertical resize 30<CR>')

-- PLUGINS
-- LSP
map('n', 'K', '<cmd>Lspsaga hover_doc<cr>')
map('i', '<C-k>', '<cmd>Lspsaga hover_doc<cr>')
map('n', 'gh', '<cmd>Lspsaga lsp_finder<cr>')
map('n', '<C-e>', '<cmd>Lspsage show_line_diagnostics<CR>')


-- Telescope
map('n', "<leader>fg", "<cmd>Telescope live_grep<cr>")
map('n', "<leader>bb", "<cmd>Telescope buffers<cr>")
map('n', "<leader>hh", "<cmd>Telescope help_tags<cr>")
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")

-- File explorer
map('n', '<leader>e', '<cmd>NvimTreeOpen<cr>')

-- yank to the eol
map('n', 'Y', 'yg_')

-- keep focus on center
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
-- map('n', 'J', 'mzJ`z')

-- Moving Text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("i", "<C-j>", "<esc>:m .+1<CR>==")
map("i", "<C-k>", "<esc>:m .-2<CR>==")
map("n", "<m-j>", ":m .+1<CR>==")
map("n", "<m-k>", ":m .-2<CR>==")

vim.cmd('noremap <C-h> :noh<cr>:call clearmatches()<cr>') --clear matches Ctrl + h

-- git
