local nmap = U.keymap.nmap
local imap = U.keymap.imap
local cmap = U.keymap.cmap
local vmap = U.keymap.vmap
local xmap = U.keymap.xmap
local omap = U.keymap.omap
local tmap = U.keymap.tmap

-- Edit vimrc
nmap('<Leader>ev', ':lcd ~/.config/nvim/<CR>:e lua/core/plugins.lua<CR>')

--- Editing
nmap('<Leader>d', '"_d')

-- Save buffer
nmap('<C-s>', ':w<CR>')
imap('<C-s>', '<esc>:w<CR>a')

-- Split window
nmap('<leader>v', ':vsplit<CR>')
nmap('<leader>s', ':split<CR>')

-- Update and go to previous file with backspace
nmap('<BS>', ':update<CR><c-^>')

-- Toggle QuickFixList
nmap('<leader>q', ':call QuickFix#Toggle("Quickfix List", "c")<CR>')

-- Escape to clear highlighting in normal mode
nmap('<esc>', ':nohlsearch<return><esc>')

-- New tab
nmap('<leader>t', ':tabedit ')

-- Previous tab (override unimpaired jump to next tag)
nmap('T', ':tabp<CR>', { noremap = true })

-- Next tab (override unimpaired jump to previous tag)
nmap('t', ':tabn<CR>', { noremap = true })


nmap('<A-o>', '<C-i>', { noremap = true })

-- Yank to end of line
nmap('Y', 'y$')

-- Smooth way of creating and moving between splits
tmap('<A-h>', '<C-\\><C-N><C-w>h')
tmap('<A-j>', '<C-\\><C-N><C-w>j')
tmap('<A-k>', '<C-\\><C-N><C-w>k')
tmap('<A-l>', '<C-\\><C-N><C-w>l')
imap('<A-h>', '<C-\\><C-N><C-w>h')
imap('<A-j>', '<C-\\><C-N><C-w>j')
imap('<A-k>', '<C-\\><C-N><C-w>k')
imap('<A-l>', '<C-\\><C-N><C-w>l')
nmap('<A-h>', '<C-w>h')
nmap('<A-j>', '<C-w>j')
nmap('<A-k>', '<C-w>k')
nmap('<A-l>', '<C-w>l')


-- Search for selection
vmap('*', 'y/\\V<C-R>=escape(@","/")<CR><CR>')

-- Search and highlight word under the cursor
nmap('<leader>*', [[:let @/ = '\<'.expand('<cword>').'\>'|set hlsearch<C-M>]])
