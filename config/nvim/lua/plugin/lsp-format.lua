require("lsp-format").setup {
  typescript = {
    tab_width = function()
      return vim.opt.shiftwidth:get()
    end,
  },
  --yaml = { tab_width = 2 },
}
local prettier = {
  formatCommand = [[npx prettier --stdin-filepath ${INPUT} ${--tab-width:tab_width}]],
  formatStdin = true,
}
require("lspconfig").efm.setup {
  on_attach = require("lsp-format").on_attach,
  init_options = { documentFormatting = true },
  settings = {
    languages = {
      typescript = { prettier },
      yaml = { prettier },
    },
  },
}
