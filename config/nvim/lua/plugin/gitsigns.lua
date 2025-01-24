local wk = require("which-key")
require('gitsigns').setup {
  signs                   = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  signcolumn              = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl                   = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl                  = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff               = false, -- Toggle with `:Gitsigns toggle_word_diff`
  attach_to_untracked     = true,
  sign_priority           = 6,
  update_debounce         = 100,
  status_formatter        = nil, -- Use default
  max_file_length         = 40000,

  on_attach               = function(bufnr)
    local gs = package.loaded.gitsigns
    wk.add({
      mode = 'n',
      prefix = 'gs',
      buffer = bufnr,

      { "gsb",  group = "Blame" },
      { "gsbf", gs.blame,                                       desc = "Blame file" },
      { "gsbl", (function() gs.blame_line { full = true } end), desc = "Blame line" },
      { "gsbt", gs.toggle_current_line_blame,                   desc = "Toggle inline blame" },

      { "gsd",  group = "Deleted" },
      { "gsdt", gs.toggle_deleted,                              desc = "Toggle deleted" },

      { "gsh",  group = "Hunk commands" },
      { "gshD", (function() gs.diffthis('~') end),              desc = "Diff against previous commit" },
      { "gshR", gs.reset_buffer,                                desc = "Reset buffer" },
      { "gshS", gs.stage_buffer,                                desc = "Stage buffer" },
      { "gshd", gs.diffthis,                                    desc = "Diff against index" },
      { "gshp", gs.preview_hunk,                                desc = "Preview hunk" },
      { "gshr", gs.reset_hunk,                                  desc = "Reset hunk" },
      { "gshs", gs.stage_hunk,                                  desc = "Stage hunk" },
      { "gshu", gs.undo_stage_hunk,                             desc = "Undo stage hunk" },
    })
  end,

  watch_gitdir            = {
    interval     = 1000,
    follow_files = true
  },

  current_line_blame      = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text     = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay         = 1000,
  },
  --current_line_blame_formatter_opts = {
  --  relative_time = false
  --},
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
