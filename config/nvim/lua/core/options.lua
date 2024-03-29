local set = U.set
local highlight = U.highlight

local o = vim.opt

-- Misc
vim.g.python_host_skip_check = 1
vim.g.python3_host_skip_check = 1
vim.g.python2_host_prog = '/usr/bin/python2'
vim.g.python3_host_prog = '/usr/bin/python3'

-- Disable mouse 
set ('mousemodel', 'extend')

-- Case insensitive :search etc.
set 'wildignorecase'
set ('wildignore', '.git,**/node_modules/**')

-- Add suffix when looking for imported files
set ('suffixesadd', '.js,.jsx,.ts,.tsx')
set ('include', 'from')

-- Look for project specific settings in /project/.nvimrc
set 'exrc'

-- Prevetn :autocmd unless owned by me
set 'secure'
set ('spelllang', 'en_gb')

-- Enable mouse.
set ('mouse','a')
set ('mousemodel', 'extend')

-- set 'wildmenu'
set ('wildoptions', 'pum')

-- Only redraw when needed
set 'lazyredraw'

-- Do not jump to first character with page commands.
set 'nostartofline'

-- Highlight matching [{()}]
set 'showmatch'
set ('completeopt','menu,menuone,noselect')

-- Use the clipboard register
set ('clipboard', 'unnamedplus')

set 'list'
set ('listchars', 'nbsp:¬,tab:\\|\\ ,extends:»,precedes:«,trail:•')
--set ('listchars', 'nbsp:¬,tab:>-,extends:»,precedes:«,trail:•')


-- Show the cursor position all the time.
set 'ruler'

-- Display incomplete commands.
set 'noshowcmd'

-- Enable ~ operator.
set 'tildeop'

-- Timeout Leader after 400 ms.
set ('timeoutlen', 800)

-- Enable virtualedit when in Visual Block mode.
set ('virtualedit', 'block')

-- Allow for unsaved changes when switchin buffers (use confirm if you want to be prompted for save)
set 'hidden'

-- Better display for messages
set ('cmdheight', 2)

-- don't give ins-completion-menu messages.
-- set shortmess+=c
set 'nomodeline'
--set ('scrolloff', 5)



-- Backup
-- Enable backup of files
set 'backup'
set 'writebackup'
set ('backupdir', '~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp')
set ('backupskip', '/tmp/*,/private/tmp/*')
set ('directory', '~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp')



-- Undo
-- Keep a persistent backup file.
set 'undofile'
set ('undodir', '~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp')



-- Folding
set ('foldmethod', 'expr')
set ('foldexpr', 'nvim_treesitter#foldexpr()')
-- This disables the folds when first opening the file
set 'nofoldenable'
--set ('foldlevelstart', '99')
--set ('foldtext', 'NeatFoldText()')



-- Colors
vim.g.nvcode_termcolors = 256
vim.cmd('syntax on')
set 'termguicolors'

-- Set colorscheme
-- Other great colorschemes:
-- - focuspoint
-- - materialbox
-- - hybrid
vim.cmd('colorscheme molokai')

-- highlight current row
set 'cursorline'
set ('colorcolumn', '120')


-- Dim inactive buffer
-- highlight('ActiveWindow', { guibg = '#000000'})
-- highlight('InactiveWindow', { guibg = '#141414' })
-- highlight('VertSplit', { guibg = '#000000', guifg = '#444444' })
-- set ('winhighlight', 'Normal:ActiveWindow,NormalNC:InactiveWindow')
-- highlight('CursorLine', { guifg = '#ff0000' })
-- highlight('CursorLineNR', { guifg = '#e900ff' })


highlight('Comment', { guifg = '#666666', gui = 'italic', cterm = 'italic' })
-- highlight('SignColumn', { guibg = '#000000' })
-- highlight('LineNr', { guibg = '#000000'})



-- Tabs (whitespace settings)
-- Render Tabs using this many spaces.
set ('tabstop', 2)
set ('softtabstop', 2)

-- Insert spaces when TAB is pressed.
set 'expandtab'

-- Indentation amount for < and > commands.
set ('shiftwidth', 2)

-- Prevents inserting two spaces after punctuation on a join (J).
set 'nojoinspaces'

-- Numbers that start with a zero will be considered to be octal
vim.cmd('set nrformats-=octal')

set 'smartindent'

set 'nowrap'

set ('pastetoggle', '<F10>')

-- Line numbers
-- Show line numbers
set 'number'

-- Gutter width for line numbers
set ('numberwidth', 3)
set ('signcolumn', 'yes')



-- Search
set ('grepprg', 'ag\\ --vimgrep\\ --nogroup\\ --nocolor')

-- Make searching case insensitive.
set 'ignorecase'

-- Use case sensitive search when query has mixed case.
set 'smartcase'

-- Use 'g' flag by default with :s/foo/bar/.
set 'gdefault'

-- set omnifunc=syntaxcomplete#Complete



-- Substitute
-- Shows the effects of a command incrementally, as you type.
set ('inccommand', 'nosplit')

-- Splits
-- Open vertical splits to the right
set 'splitright'

-- Open horizontal splits below
set 'splitbelow'

-- Open diff in vertical split
vim.cmd('set diffopt+=vertical')
vim.cmd('set diffopt+=indent-heuristic')
vim.cmd('set diffopt+=algorithm:patience')



-- Netrw
--vim.g.netrw_liststyle = 4
--vim.g.netrw_preview = 1
--vim.g.netrw_alto = 0
--vim.g.netrw_winsize = 50
--vim.g.netrw_keepdir = 1
--vim.g.netrw_menu = 0
--vim.g.netrw_banner = 0
--
---- Allow netrw to remove non-empty local directories
--vim.g.netrw_localrmdir = 'rm -r'
--vim.g.netrw_bufsettings = 'noma nomod nu nowrap ro nobl'


-- highlight('MyActiveSignColumn', { guibg = '#0000ff' })
-- highlight('MyInactiveSignColumn', { guibg = '#ff0000' })


-- Files & Languages
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = {"Jenkinsfile"},
  command = "setf groovy",
})
