if vim.fn.exists('g:vscode') ~= 1 then
  require('core.utils')
  require('core.plugins')
  require('core.commands')
  require('core.autocmds')
  require('core.options')
end

require('core.macros')
require('core.keymaps')

if vim.fn.has('macunix') then
  require('core.keymaps-macos')
end
