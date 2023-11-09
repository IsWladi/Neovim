return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "anuvyklack/hydra.nvim",
    "mfussenegger/nvim-dap-python",
  },
  keys = { { "<leader>d", desc = "Open Debug menu" },
           {"<leader>dt", function () require('dapui').toggle() end, desc = "[DAP] toggle dap ui"},
           {"<leader>dd", function () require('dap').continue() end}
  },

  config = function()
    require "wladi.dap"

    -- dap python config
    require('dap-python').setup('C:/Users/isaac/AppData/Local/nvim-data/mason/packages/debugpy/venv/Scripts/python.exe')
  end,
}
