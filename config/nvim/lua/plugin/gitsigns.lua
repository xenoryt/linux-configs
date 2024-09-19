local wk = require("which-key")
require('gitsigns').setup {
  signs                   = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  signcolumn              = true,            -- Toggle with `:Gitsigns toggle_signs`
  numhl                   = false,           -- Toggle with `:Gitsigns toggle_numhl`
  linehl                  = false,           -- Toggle with `:Gitsigns toggle_linehl`
  word_diff               = false,           -- Toggle with `:Gitsigns toggle_word_diff`
  on_attach               = function(bufnr)
    local gs = package.loaded.gitsigns
    wk.register({
      h = {
        name = 'Hunk commands',
        s = { gs.stage_hunk, 'Stage hunk' },
        r = { gs.reset_hunk, 'Reset hunk' },
        S = { gs.stage_buffer, 'Stage buffer' },
        R = { gs.reset_buffer, 'Reset buffer' },
        u = { gs.undo_stage_hunk, 'Undo stage hunk' },
        p = { gs.preview_hunk, 'Preview hunk' },
        d = { gs.diffthis, 'Diff against index' },
        D = { function() gs.diffthis('~') end, 'Diff against previous commit' },
      },

      b = {
        name = 'Blame',
        l = { (function() gs.blame_line { full = true } end), 'Blame line' },
        t = { gs.toggle_current_line_blame, 'Toggle blame' },
      },

      d = {
        name = 'Deleted',
        t = { gs.toggle_deleted, 'Toggle deleted' },
      },

    }, {
      mode = 'n',
      prefix = 'gs',
      buffer = bufnr,
    })
  end,
  watch_gitdir            = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked     = true,
  current_line_blame      = false,           -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
  },
  --current_line_blame_formatter_opts = {
  --  relative_time = false
  --},
  sign_priority           = 6,
  update_debounce         = 100,
  status_formatter        = nil,           -- Use default
  max_file_length         = 40000,
  preview_config          = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  diff_opts               = {
    -- If vim.diff or luajit is present
    internal = true
  },
  -- yadm                              = {
  --   enable = false
  -- },
}
