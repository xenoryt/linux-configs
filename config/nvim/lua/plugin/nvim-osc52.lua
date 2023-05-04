--- https://github.com/ojroques/nvim-osc52
require('osc52').setup {
  max_length = 0,  -- Maximum length of selection (0 for no limit)
  silent = false,  -- Disable message on successful copy
  trim = false,    -- Trim text before copy
}

local osc = require('osc52')
local function copy()
  if vim.v.event.operator == 'y' then
      osc.copy_register('+')
  end
end

vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})

