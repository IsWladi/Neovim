return {
  {"zbirenbaum/copilot.lua",
    event = "VeryLazy",
    config = true,
    opts = {
      suggestion = {
        keymap = {
          accept = "<C-a>",
        },
        auto_trigger = true,
      },
      filetypes = {
        ["*"] = true,
      },
    },
  },
}
