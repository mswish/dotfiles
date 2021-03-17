require('lspconfig').tsserver.setup{
    on_attach=require('completion').on_attach,
    cmd={"typescript-language-server", "--stdio"},
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
} 

require('lspconfig').pyright.setup{ on_attach=require'completion'.on_attach }
