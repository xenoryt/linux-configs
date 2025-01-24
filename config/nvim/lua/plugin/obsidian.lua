local obs = require("obsidian")
obs.setup({
  workspaces = {
    {
      name = "root",
      path = "~/Obsidian Notes",
    },
    {
      name = "notes",
      path = "~/Obsidian Notes/Notes",
    },
    {
      name = "work",
      path = "~/Obsidian Notes/WorkTasks",
    },
  },
  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "Daily Notes",
  },
  --daily_notes = {
  --  template = "~/Obsidian Notes/Templates/Standup.md",
  --},

  --templates = {
  --  subdir = "templates",
  --}
  mappings = {
    ["<leader>ox"] = {
      action = function()
        return obs.util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
    ["<leader>ot"] = {
      action = "<cmd>ObsidianToday<cr>",
    },
    ["<leader>oY"] = {
      action = "<cmd>ObsidianYesterday<cr>",
    },
    ["<cr>"] = {
      action = function()
        return obs.util.smart_action()
      end,
      opts = { buffer = true, expr = true },
    }
  }
})

local wk = require("which-key")
wk.add({
  { "<leader>oD", "<cmd>ObsidianDailies<cr>",          desc = "Open Obsidian Dailies" },
  { "<leader>oS", "<cmd>ObsidianSearch<cr>",           desc = "Search Obsidian docs" },
  { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>",      desc = "Obsidian Quick Switch" },
  { "<leader>oo", "<cmd>e ~/Obsidian Notes/Notes<cr>", desc = "Open Obsidian Notes folder" },
}, { mode = 'n' })
