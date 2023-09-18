return {
  {"zbirenbaum/copilot.lua",
    event = "VeryLazy",
    config = true,
    opts = {
      suggestion = {
        keymap = {
          accept = "<M-r>",
        },
        auto_trigger = true,
      },
      filetypes = {
        ["*"] = true,
      },
    },
  },
}
