local command = U.command

-- Lsp
command("LspReload", "lua require'lsp_config'.lsp_reload(0)")
command("LspStop", "lua require'lsp_config'.lsp_stop(0)")
command("LspClearDiagnostics", "lua vim.lsp.diagnostic.clear(0)")
command("LspPrint", "lua print(vim.inspect(vim.lsp.buf_get_clients()))")
