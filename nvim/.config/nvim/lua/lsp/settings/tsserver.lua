return {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  -- capabilities = capabilities,
  root_dir = require('lspconfig').util.find_node_modules_ancestor(),
}
