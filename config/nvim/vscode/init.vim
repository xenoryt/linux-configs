let s:currDir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
"execute 'source ' . s:currDir . '/defaults/vim/vscode-neovim.vim'
execute 'source ' . s:currDir . '/options.vim'
execute 'source ' . s:currDir . '/keymaps.vim'

"source ~/.config/nvim/vscode/defaults/vim/vscode-neovim.vim
"source ~/.config/nvim/vscode/options.vim
"source ~/.config/nvim/vscode/keymaps.vim

