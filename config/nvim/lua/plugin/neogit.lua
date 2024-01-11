local neogit = require("neogit")

--neogit.setup {}

neogit.setup {
  disable_commit_confirmation = true,
  integrations = {
    diffview = true,
    fzf_lua = true
  },
  -- override/add mappings
  mappings = {
    popup = {
      -- Adds a mapping with "B" as key that does the "BranchPopup" command
      ["b"] = "BranchPopup",
    },
    -- modify status buffer mappings
    status = {
      -- Remove "tab"
      ["<tab>"] = false,

      ["o"] = "Toggle"
    }
  }
}


local nmap = U.keymap.nmap
nmap('<Leader>g', ':Neogit<CR>')
