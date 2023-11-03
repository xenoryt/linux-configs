require('go').setup()

vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

require('go').setup({
  lsp_cfg = true,
  lsp_keymaps = true,
  lsp_diag_underline = false,
})
