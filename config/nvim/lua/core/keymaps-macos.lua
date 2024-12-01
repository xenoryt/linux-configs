local map = U.keymap.map
local nmap = U.keymap.nmap
local imap = U.keymap.imap
local cmap = U.keymap.cmap
local vmap = U.keymap.vmap
local xmap = U.keymap.xmap
local omap = U.keymap.omap
local tmap = U.keymap.tmap

-- Smooth way of creating and moving between splits
tmap('<D-h>', '<C-\\><C-N><C-w>h')
tmap('<D-j>', '<C-\\><C-N><C-w>j')
tmap('<D-k>', '<C-\\><C-N><C-w>k')
tmap('<D-l>', '<C-\\><C-N><C-w>l')
imap('<D-h>', '<C-\\><C-N><C-w>h')
imap('<D-j>', '<C-\\><C-N><C-w>j')
imap('<D-k>', '<C-\\><C-N><C-w>k')
imap('<D-l>', '<C-\\><C-N><C-w>l')
nmap('<D-h>', '<C-w>h')
nmap('<D-j>', '<C-w>j')
nmap('<D-k>', '<C-w>k')
nmap('<D-l>', '<C-w>l')


nmap('<D-left>', '<home>')
nmap('<D-right>', '<end>')
