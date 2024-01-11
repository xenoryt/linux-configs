require("obsidian").setup({
  workspaces = {
    {
      name = "work",
      path = "~/Obsidian Notes/WorkTasks",
    },
    {
      name = "personal",
      path = "~/Obsidian Notes",
    },
  },
  daily_notes = {
    template = "~/Obsidian Notes/Templates/Standup.md",
  },

  --templates = {
  --  subdir = "templates",
  --}
})
