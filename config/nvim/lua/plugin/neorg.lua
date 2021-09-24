local nmap = U.keymap.nmap

nmap('<Leader>n', ':lcd ~/neorg<CR>:echo "Directory set to ~/neorg"<CR>')

require('neorg').setup {
  -- Tell Neorg what modules to load
  load = {
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.keybinds"] = { -- Configure core.keybinds
      config = {
        default_keybinds = true, -- Generate the default keybinds
        neorg_leader = "<Leader>o" -- This is the default if unspecified
      }
    },
    ["core.integrations.telescope"] = {}, -- Enable the telescope module
    ["core.norg.concealer"] = {}, -- Allows for use of icons
    ["core.norg.dirman"] = { -- Manage your directories with Neorg
      config = {
        workspaces = {
          workspace = "~/neorg",
        }
      }
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-compe"
      }
    }
  },

  --logger = {
  --  -- Should print the output to neovim while running
  --  use_console = true,

  --  -- Should highlighting be used in console (using echohl)
  --  highlights = true,

  --  -- Should write to a file
  --  use_file = true,

  --  -- Any messages above this level will be logged.
  --  level = "warn",
  --}
}
