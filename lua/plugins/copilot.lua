return {
  {"zbirenbaum/copilot.lua",
    event = "VeryLazy",
    config = true,
    opts = {
      -- Disable the default completion to use the copilot completion
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function ()
          require("copilot_cmp").setup()
        end
      }
    },
  },
}

