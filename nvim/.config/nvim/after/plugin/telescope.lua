local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.load_extension("media_files")
telescope.load_extension("zk")

local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                --["<C-h>"] = "which_key"
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,

                -- ['<esc>'] = actions.close,
                ["<C-c>"] = actions.close,

                ["C-q"] = actions.send_to_qflist + actions.open_qflist,
            },
        },
        file_ignore_patterns = { "node_modules" },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   etension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure

        media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg",
        },
    },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>gf", builtin.git_files, { silent = true})

