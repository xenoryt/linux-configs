local lspconfig = require('lspconfig')
--local lspinstall = require("nvim-lsp-installer")
local languages = require('plugin.nvim-lspconfig.format')
local on_attach_common = require('plugin.nvim-lspconfig.on-attach')
local palette = U.palette

-- Customize diagnostics signs
local function set_sign(type, icon)
  local sign = string.format("LspDiagnosticsSign%s", type)
  local texthl = string.format("LspDiagnosticsDefault%s", type)
  vim.fn.sign_define(sign, {text = icon, texthl = texthl})
end

-- Customize diagnostics highlights
local function set_highlight(type, color)
  vim.cmd(string.format("highlight! LspDiagnosticsDefault%s guifg=%s", type, color))
end

-- Check if a eslint config is present
local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  if pcall(vim.fn.filereadable("package.json")) then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end

  return false
end

_G.formatting = function()
  if not vim.g[string.format("format_disabled_%s", vim.bo.filetype)] then
    vim.lsp.buf.formatting(vim.g[string.format("format_options_%s", vim.bo.filetype)] or {})
  end
end

set_sign("Hint", "")
set_sign("Information", "")
set_sign("Warning", "")
set_sign("Error", "ﰸ")

set_highlight("Hint", palette.green)
set_highlight("Information", palette.cyan)
set_highlight("Warning", palette.yellow)
set_highlight("Error", palette.red)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {'documentation', 'detail', 'additionalTextEdits'},
}


-- configuring diagnostics
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false, -- disable inline diagnostics
    signs = true,
    update_in_insert = false,
  }
)


local function setup_servers()
  --lspinstall.setup()

  local configs = {}

  -- Efm language server
  -- https://github.com/mattn/efm-langserver
  configs.efm = {
    init_options = {documentFormatting = true, codeAction = true, document_formatting = true},
    root_dir = lspconfig.util.root_pattern({'.git/', '.'}),

    filetypes = {
      "json",
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescript.tsx",
      "typescriptreact",
      "less",
      "scss",
      "css"
    },
    settings = {languages = languages, log_level = 1, log_file = '~/efm.log'},
  }

  -- Python languageserver
  -- https://github.com/palantir/python-language-server
  configs.python = {
    filetypes = { "python" },
    settings = {
      pyls = {
        plugins = {
          pycodestyle = {
            enabled = false,
            ignore = {
              "E501"
            }
          }
        }
      }
    }
  }

  -- Terraform languageserver
  -- https://github.com/hashicorp/terraform-ls
  configs.terraform = {
    cmd = {"terraform-ls", "serve"},
    filetypes = {"tf"}
  }

  -- local installed = lspinstall.get_installed_servers()
  -- for _, server in pairs(installed) do
  --   local config = configs[server.name] or {}
  --   config.root_dir = lspconfig.util.root_pattern({'.git/', '.'})
  --   config.capabilities = capabilities
  --   config.on_attach = function(client)
  --     require("lsp-format").on_attach(client)
  --     if server.name == "typescript" then
  --       client.server_capabilities.documentFormattingProvider = false
  --     end
  --     on_attach_common(client)
  --   end
  --   lspconfig[server.name].setup(config)
  -- end

end

setup_servers()
