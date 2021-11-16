-- SETTINGS
-- HOME = os.getenv("HOME")
local o = vim.o

-- OPTIONS
-- Basic
o.encoding = "utf-8"
-- o.backspace = 'indent,eol,start'
o.history = 1000
-- o.completeopt = 'menuone, noselect'

o.syntax = 'on'
o.compatible = false
o.mouse = 'a'
o.title = true
o.termguicolors = false

-- Search
-- o.hlsearch = true
o.incsearch = true
o.smartcase = true
o.ignorecase = true

--
o.autoindent = true
o.shiftwidth = 0
o.tabstop = 2
o.expandtab = true

-- Visual
o.cmdheight = 1
o.scrolloff = 4
o.cursorline = true
o.background = 'dark'
o.showcmd = true
-- vim.cmd('colorscheme Tomorrow-Night')

o.showbreak = '↪' --not working yet

-- -- Sidebar
o.number = true
o.numberwidth = 4
o.modelines = 0
o.relativenumber = true
o.signcolumn = 'yes'

-- Window
o.splitbelow = true
o.splitright = true

-- Commands mode
o.wildmenu = true

-- Clipboard
o.clipboard = 'unnamedplus'

-- Experiment
o.lazyredraw = true

-- Backup files
-- o.backup = true
o.writebackup = false
o.swapfile = false
-- o.undodir = HOME .. '/.vim/tmp/undo//' --undo files
-- o.backupdir = HOME .. '/.vim/tmp/backup//' --backup files
-- o.directory = HOME .. '/.vim/tmp/swap//' --swap files


-- not sure
-- enable line-wrapping with left and right cursor movement
-- opt.whichwrap:append({ ['<'] = true, ['>'] = true, ['h'] = true, ['l'] = true, ['['] = true, [']'] = true })
-- add @, -, and $ as keywords for full SCSS support
-- opt.iskeyword:append({ '@-@', '-', '$' })
