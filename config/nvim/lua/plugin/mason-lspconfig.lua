local lspconfig = require("lspconfig")
local on_attach_common = require('plugin.nvim-lspconfig.on-attach')

local prettier = {
  formatCommand = [[npx prettier --stdin-filepath ${INPUT} ${--tab-width:tab_width}]],
  formatStdin = true,
}

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "bashls",
    "gopls",
    --"vim",
    --"yamlls",
  },

  handlers = {
    function(server_name)
      lspconfig[server_name].setup({
        on_attach = on_attach_common,
      })
    end
  },

  ["efm"] = function()
    lspconfig.efm.setup {
      on_attach = on_attach_common,
      init_options = { documentFormatting = true,
        documentFormattingProvider = true
      },
      settings = {
        languages = {
          typescript = { prettier },
          yaml = { prettier },
          json = { prettier },
        },
      },
      filetypes = {
        "typescript",
        "javascript",
        "yaml",
        "json",
      }
    }
  end,
})
