require("nvim-treesitter.configs").setup({
    --[[ ensure_installed = {
        "bash",
        "css",
        "html",
        "http",
        "javascript",
        "lua",
        "markdown",
        "regex",
        "scss",
        "toml",
        "tsx",
        "typescript",
        "astro",
        "go",
        "gomod",
        "gosum",
        "java",
        "jq",
        "json",
        "make",
        "dockerfile",
        "sql",
        "yaml",
        "gitcommit",
        "vim", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    }, ]]
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        -- disable = { "c", "rust" },  -- list of language that will be disabled
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
    },
    autopairs = {
        enable = true,
    },
})
