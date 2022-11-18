-- SETTINGS
-- HOME = os.getenv("HOME")

local options = {
    -- Basic
    encoding = "utf-8",
    backspace = "indent,eol,start",
    history = 1000,
    --completeopt = 'menuone, noselect' -- breaking

    syntax = "on",
    compatible = false,
    mouse = "a",
    title = true,
    -- termguicolors = true

    -- Search
    -- hlsearch = true
    incsearch = true,
    smartcase = true,
    ignorecase = true,

    --
    autoindent = true,
    shiftwidth = 0,
    tabstop = 4,
    expandtab = true,

    -- Visual
    cmdheight = 1,
    scrolloff = 4,
    cursorline = true,
    background = "dark",
    showcmd = true,
    listchars = "trail:.",
    pumheight = 10,

    showbreak = "↪",

    -- -- Sidebar
    number = true,
    numberwidth = 4,
    modelines = 0,
    relativenumber = true,
    signcolumn = "yes",

    -- Window
    splitbelow = true,
    splitright = true,
    hidden = true,

    -- Commands mode
    wildmenu = true,

    -- Clipboard
    clipboard = "unnamedplus",

    -- Experiment
    lazyredraw = true,

    -- Backup files
    -- backup = true
    writebackup = false,
    swapfile = false,
    -- undodir = HOME .. '/.vim/tmp/undo//' --undo files
    -- backupdir = HOME .. '/.vim/tmp/backup//' --backup files
    -- directory = HOME .. '/.vim/tmp/swap//' --swap files

    -- global status window
    laststatus = 3,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- not sure
-- enable line-wrapping with left and right cursor movement
vim.opt.whichwrap:append({ ["<"] = true, [">"] = true, ["h"] = true, ["l"] = true, ["["] = true, ["]"] = true })
-- add @, -, and $ as keywords for full SCSS support
vim.opt.iskeyword:append({ "@-@", "-", "$" })
