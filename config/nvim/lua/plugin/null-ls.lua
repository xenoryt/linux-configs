local null_ls = require("null-ls")
local on_attach_common = require('plugin.nvim-lspconfig.on-attach')

null_ls.setup({
  on_attach = on_attach_common,
  sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "javascript",
        "typescript",
        "json",
        --"yaml"
      },
    })
  }
})
