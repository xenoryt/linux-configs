local on_attach = require('plugin.nvim-lspconfig.on-attach')

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimports()
  end,
  group = format_sync_grp,
})


require('go').setup({
  lsp_cfg = true,
  lsp_keymaps = true,
  diagnostic = {
    underline = false
  },
  lsp_on_attach = on_attach.attach_mappings,
})
