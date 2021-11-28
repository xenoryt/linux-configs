local nmap = U.keymap.nmap

nmap('<C-\\>', ':CHADopen<CR>')

local chadtree_settings = { 
  keymap = {
    primary = {"o"},
    secondary = {"<enter>"},
    tertiary = {"<c-t>"},
    v_split = {"<c-v>"},
    h_split = {"<c-x>"},

    collapse = {"<backspace>"},
    change_dir = {"cd"},
    change_focus = {"u"},
    change_focus_up = {"U"},

    open_sys = {"<c-o>"},
    jump_to_current = {"."},

    select = {" "},
    clear_selection = {"<s-space>", "S"},

    toggle_hidden = {"zh"},
    toggle_follow = {"zf"},
    toggle_version_control = {"zg"},
  }
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
