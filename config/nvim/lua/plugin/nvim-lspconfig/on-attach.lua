local lsp_enabled = false
local formatting_enabled = false


local buf_nmap = U.keymap.buf_nmap
local buf_imap = U.keymap.buf_imap
local function lua_nmap(lhs, rhs, opts)
  buf_nmap(lhs, '<cmd>lua  ' .. rhs .. '<CR>', opts)
end

local function lua_imap(lhs, rhs, opts)
  buf_imap(lhs, '<cmd>lua  ' .. rhs .. '<CR>', opts)
end

-- Prettier
local format_options_prettier = {
  tabWidth = 2,
  useTabs = false,
  singleQuote = true,
  trailingComma = "all",
  configPrecedence = "prefer-file"
}

vim.g.format_options_typescript = format_options_prettier
vim.g.format_options_javascript = format_options_prettier
vim.g.format_options_typescriptreact = format_options_prettier
vim.g.format_options_javascriptreact = format_options_prettier
vim.g.format_options_json = format_options_prettier
vim.g.format_options_css = format_options_prettier
vim.g.format_options_scss = format_options_prettier
vim.g.format_options_html = format_options_prettier
vim.g.format_options_yaml = format_options_prettier
vim.g.format_options_markdown = format_options_prettier

FormatToggle = function(value)
  vim.g[string.format("format_disabled_%s", vim.bo.filetype)] = value
end

U.command('FormatDisable', 'lua FormatToggle(true)')
U.command('FormatEnable', 'lua FormatToggle(false)')

_G.formatting = function()
  if not vim.g[string.format("format_disabled_%s", vim.bo.filetype)] then
    vim.lsp.buf.formatting(vim.g[string.format("format_options_%s", vim.bo.filetype)] or {})
  end
end

-- All of these are buffer mappings
local function mappings()
  -- GOTO mappings
  lua_nmap('gD', 'vim.lsp.buf.declaration()')
  lua_nmap('gd', 'vim.lsp.buf.definition()')
  lua_nmap('K', 'vim.lsp.buf.hover()')
  --lua_nmap('K', 'require("lspsaga.hover").render_hover_doc()')
  lua_nmap('gr', 'vim.lsp.buf.references()')
  lua_nmap('<space>gh', 'vim.lsp.buf.signature_help()')
  lua_nmap('gi', 'vim.lsp.buf.implementation()')
  -- ACTION mappings
  lua_imap('<C-space>', 'vim.lsp.buf.completion()')
  lua_nmap('<space>aa', 'vim.lsp.buf.code_action()')
  -- lua_nmap('<space>aa', 'vim.lsp.buf.code_action()')
  -- lua_nmap('<space>ar', 'require("lspsaga.rename").rename()')
  lua_nmap('<space>ar', 'vim.lsp.buf.rename()')
  -- Few language severs support these three
  lua_nmap('<space>f', 'vim.lsp.buf.formatting()')
  lua_nmap('<leader>ai', 'vim.lsp.buf.incoming_calls()')
  lua_nmap('<leader>ao', 'vim.lsp.buf.outgoing_calls()')

  -- Diagnostics mapping
  lua_nmap('<space>e', 'vim.diagnostic.open_float()')
  lua_nmap('<space>d', 'vim.diagnostic.setloclist()')
  buf_nmap('<space>D', 'lclose')
  lua_nmap(']d', 'vim.diagnostic.goto_next()')
  lua_nmap('[d', 'vim.diagnostic.goto_prev()')
end

return function(client)
  if not lsp_enabled then
    print("LSP started.");
    mappings()
  end

  -- if client.name ~= 'efm' then client.resolved_capabilities.document_formatting = false end

  if not formatting_enabled and client.server_capabilities.documentFormattingProvider then
    print("Formatting enabled.", client.name);
    vim.cmd [[autocmd! BufWritePre <buffer> lua vim.lsp.buf.format({async = false})]]
  end
end
