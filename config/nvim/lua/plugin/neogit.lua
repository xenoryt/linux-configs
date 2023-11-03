local neogit = require("neogit")

neogit.setup {
  integrations = {
    -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
    -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
    --
    -- Requires you to have `sindrets/diffview.nvim` installed.
    -- use { 
    --   'TimUntersberger/neogit', 
    --   requires = { 
    --     'nvim-lua/plenary.nvim',
    --     'sindrets/diffview.nvim' 
    --   }
    -- }
    --
    diffview = true
  },
  -- override/add mappings
  mappings = {
    -- modify status buffer mappings
    status = {

      -- Remove "tab"
      ["<tab>"] = false,

      -- Adds a mapping with "B" as key that does the "BranchPopup" command
      ["B"] = "BranchPopup",

      ["o"] = "Toggle"
    }
  }
}


local nmap = U.keymap.nmap
nmap('<Leader>g', ':Neogit<CR>')

