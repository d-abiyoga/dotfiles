--[[
vim.cmd([[
    set tabstop=2


     set background=light
    " Set contrast.
    " This configuration option should be placed before `colorscheme everforest`.
    " Available values: 'hard', 'medium'(default), 'soft'
    let g:everforest_background = 'soft'
    " For better performance
    let g:everforest_better_performance = 1

    colorscheme everforest
    " set conceallevel=2
]]

-- ZenMode
require('zen-mode').setup{
    plugins = {
        gitsigns ={ enabled = true }
    }

}

local opts = { noremap=true, silent=false }
-- Create a new note after asking for its title.
vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title:')}<CR>", opts)

-- Open notes.
vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
-- Open notes associated with the selected tags.
vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)

-- Search for the notes matching a given query.
vim.api.nvim_set_keymap("n", "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", opts)
-- Search for the notes matching the current visual selection.
vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)
vim.keymap.set("n", "<leader>zz","<CMD>ZenMode<cr>", {}) 
vim.keymap.set("n", "<leader>fzn","<CMD>Telescope zk notes<cr>", opts) 
vim.keymap.set("n", "<leader>fzt","<CMD>Telescope zk tags<cr>", opts) 

