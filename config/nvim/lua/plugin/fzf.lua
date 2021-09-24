local nmap = U.keymap.nmap
local imap = U.keymap.imap


if vim.fn.executable('rg') then
  --vim.g['FZF_DEFAULT_COMMAND'] = "rg --files --hidden -g '!.git' "
  vim.cmd [[
    function! RipgrepFzf(query, fullscreen)
      let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
      let initial_command = printf(command_fmt, shellescape(a:query))
      let reload_command = printf(command_fmt, '{q}')
      let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
      call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    endfunction

    command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
    command! -nargs=* -bang Files call fzf#vim#files(<q-args>, fzf#vim#with_preview({'source': "rg --files --hidden -g '!.git'"}), <bang>0)
    command! -nargs=* -bang FilesNoIgnore call fzf#vim#files(<q-args>, fzf#vim#with_preview({'source': "rg --no-ignore --files --hidden -g '!.git'"}), <bang>0)
  ]]
end

nmap('<C-p>', ':Files<CR>')
nmap('<C-A-p>', ":FilesNoIgnore<CR>")
nmap('<Leader>F', ":RG<CR>")
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
