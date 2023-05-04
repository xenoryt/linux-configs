local on_attach_common = require('plugin.nvim-lspconfig.on-attach')

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
      require("lspconfig")[server_name].setup({
        on_attach = on_attach_common,
      })
    end
  }
})
