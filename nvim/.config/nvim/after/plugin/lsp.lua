local lsp = require("lsp-zero")

lsp.preset("recommended")

-- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'lua_ls', 'gopls'}

-- Ensure the servers above are installed
--[[ require('mason-lspconfig').setup { ]]
--[[   ensure_installed = servers, ]]
--[[ } ]]

lsp.on_attach(function(client, bufnr)
    print("help")
    local opts = { buffer = bufnr, remap = false, silent = true }

    vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "<C-K>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>fmt", function() vim.lsp.buf.formatting() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

    --[[ vim.keymap.set("n", "gr", function() vim.lsp.buf.workspace_symbol() end, opts) ]]
    vim.keymap.set("n", "gr", function() require('telescope.builtin').lsp_references() end, { buffer = bufnr, desc = "[G]oto [R]eferences"})
    vim.keymap.set("n", "<leader>ds", function() require('telescope.builtin').lsp_document_symbols() end, { buffer = bufnr, desc = "[D]ocument [S]ymbols"})
    vim.keymap.set("n", "<leader>ws", function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end, { buffer = bufnr, desc = "[W]orkspace [S]ymbols"})
end)

-- nvim-cmp supports additional completion capabilities
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- for _, lsp in ipairs(servers) do
--   require('lspconfig')[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

local lspconfig = require('lspconfig')
require'lspconfig'.golangci_lint_ls.setup{
    cmd = {'golangci-lint-langserver'},
	root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
    init_options = {
            command = { "golangci-lint", "run", "--fast", "--out-format", "json", "--issues-exit-code=1", "--allow-parallel-runners" };
    }
}

lsp.setup()
