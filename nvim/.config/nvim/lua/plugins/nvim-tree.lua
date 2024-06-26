-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌",
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
    },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
    },
    -- auto_close = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    -- update_to_buf_dir = {
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = "right",
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
                { key = "h", cb = tree_cb("close_node") },
                { key = "v", cb = tree_cb("vsplit") },
            },
        },
        number = false,
        relativenumber = false,
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 400,
    },
    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = false,
            --[[ window_picker = { ]]
            --[[     enable = true, ]]
            --[[     chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890", ]]
            --[[     exclude = { ]]
            --[[         filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" }, ]]
            --[[         buftype = { "nofile", "terminal", "help" }, ]]
            --[[     }, ]]
            --[[ }, ]]
        },
    },
})

-- show_icons = {
--   git = 1,
--   folders = 1,
--   files = 1,
--   folder_arrows = 1,
--   tree_width = 30,
-- },
--
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
}

vim.g.nvim_tree_root_folder_modifier = ":t"
--[[ vim.g.nvim_tree.actions.open_file.resize_window = false ]]
