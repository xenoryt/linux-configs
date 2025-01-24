local lsp_enabled = false
local buf_nmap = U.keymap.buf_nmap
local buf_imap = U.keymap.buf_imap
local function lua_nmap(lhs, rhs, opts)
  buf_nmap(lhs, '<cmd>lua  ' .. rhs .. '<CR>', opts)
end

local function lua_imap(lhs, rhs, opts)
  buf_imap(lhs, '<cmd>lua  ' .. rhs .. '<CR>', opts)
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

local function attach_mappings(client)
  if not lsp_enabled then
    print("LSP started for", client.name);
    mappings()
    lsp_enabled = true
  end
end

local function attach_formatter(client)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd [[autocmd! BufWritePre <buffer> lua vim.lsp.buf.format()]]
  end
end

return {
  attach_mappings = attach_mappings,
  attach_formatter = attach_formatter,
  attach_all = function(client)
    attach_mappings(client)
    attach_formatter(client)
  end
}
