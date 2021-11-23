-- SETTINGS
-- HOME = os.getenv("HOME")

-- OPTIONS
-- Basic
vim.o.encoding = "utf-8"
-- vim.o.backspace = 'indent,eol,start'
vim.o.history = 1000
-- vim.o.completeopt = 'menuone, noselect'

vim.o.syntax = 'on'
vim.o.compatible = false
vim.o.mouse = 'a'
vim.o.title = true
-- vim.o.termguicolors = true

-- Search
-- vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.ignorecase = true

--
vim.o.autoindent = true
vim.o.shiftwidth = 0
vim.o.tabstop = 2
vim.o.expandtab = true

-- Visual
vim.o.cmdheight = 1
vim.o.scrolloff = 4
vim.o.cursorline = true
vim.o.background = 'dark'
vim.o.showcmd = true
vim.o.listchars ='trail:.'
-- vim.cmd('colorscheme Tomorrow-Night')

vim.o.showbreak = '↪' --not working yet

-- -- Sidebar
vim.o.number = true
vim.o.numberwidth = 4
vim.o.modelines = 0
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'

-- Window
vim.o.splitbelow = true
vim.o.splitright = true

-- Commands mode
vim.o.wildmenu = true

-- Clipboard
vim.o.clipboard = 'unnamedplus'

-- Experiment
vim.o.lazyredraw = true

-- Backup files
-- vim.o.backup = true
vim.o.writebackup = false
vim.o.swapfile = false
-- vim.o.undodir = HOME .. '/.vim/tmp/undo//' --undo files
-- vim.o.backupdir = HOME .. '/.vim/tmp/backup//' --backup files
-- vim.o.directory = HOME .. '/.vim/tmp/swap//' --swap files


-- not sure
-- enable line-wrapping with left and right cursor movement
-- vim.opt.whichwrap:append({ ['<'] = true, ['>'] = true, ['h'] = true, ['l'] = true, ['['] = true, [']'] = true })
-- add @, -, and $ as keywords for full SCSS support
-- vim.opt.iskeyword:append({ '@-@', '-', '$' })
