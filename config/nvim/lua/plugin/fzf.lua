local nmap = U.keymap.nmap
local imap = U.keymap.imap

nmap('<C-p>', ':FZF<CR>')
nmap('<C-A-P>', ":call fzf#run(fzf#wrap({'source': 'find . -type f -not -path *.git/*'}))<CR>")
nmap('<Leader>bb', ':History<CR>')

--nmap('<C-p>', ':call CustomFZF#FilesWithDevIcons()<CR>')
--nmap('<leader>p', ':FzfBuffers<CR>')
--nmap('<leader>ff', ':FZFAg<CR>')
--nmap('<leader>fg', ':FZFAg<CR>')
--nmap('<leader>hh', ':FZFHistory:<CR>')
--nmap('<leader>fl', ':FZFBLines<CR>')
--nmap('<leader>fh', ':FZFHistory<CR>')
--nmap('<leader>fd', ':BD<CR>')
--nmap('<leader>fb', ':FzfGBranches<CR>')

imap('<C-f>', '<Plug>(fzf-complete-path)', {})
imap('<C-l>', '<Plug>(fzf-complete-line)', {})
