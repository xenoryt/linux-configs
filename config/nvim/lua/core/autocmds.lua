U.nvim_create_augroup({
  ftplugin = {
    { 'FileType', 'man',                    'setl laststatus=0 noruler' },
    { 'FileType', 'NvimTree',               'setl scl=no' },
    { 'FileType', 'vim,lua,css,javascript', 'setl sw=2' },
    { 'TermOpen', 'term://*',               'setl nornu nonu nocul so=0 scl=no' },
  },

  disable_autoindent = {
    { 'FileType', 'yaml', 'setl indentkeys-=0#' }
  },
  --on_save = {
  --  {'BufWritePost', '*.vim,*.lua', 'source %'},
  --},
  --general = {
  --  {'TextYankPost', '*', 'silent! lua vim.highlight.on_yank { timeout = 150 }'},
  --  {'FileType', '*', 'set fo-=cro'}, -- Avoid newline continuation of comments
  --},

  --xresources = {
  --  {'BufWritePost', '*Xresources,*Xdefaults', 'silent! !xrdb -load %'},
  --},

  terminal = {
    { 'TermOpen', '*', 'setlocal nonumber | setlocal signcolumn=no' }
  },

  --open_in_split_from_qf = {
  --  { 'FileType', 'qf', 'nmap <buffer> <leader><Enter> <C-w><Enter><C-w>L' }
  --},

  --bwc_create_dir = {
  --  { 'BufWritePre', '*', ':call Folders#MkNonExDir(expand("<afile>"), +expand("<abuf>"))' }
  --},

  --dirvish_config = {
  --  { 'FileType', 'dirvish', 'silent! unmap <buffer> <C-p>' },
  --  { 'FileType', 'dirvish', 'silent! unmap <buffer> <C-n>' }
  --},

  --sneak = {
  --  { 'ColorScheme', ' ', 'hi! Sneak guifg=black guibg=aqua ctermfg=black ctermbg=green' },
  --},
})
