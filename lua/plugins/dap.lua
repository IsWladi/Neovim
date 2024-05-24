return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "anuvyklack/hydra.nvim",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/nvim-nio",
  },
  keys = { { "<F5>"},
           {"<F1>"},
           {"<leader>bp"}
  },

  config = function()
    require "wladi.dap"
    dap, dapui = require "dap", require "dapui"

    -- dap movements
    vim.keymap.set('n', '<F5>', dap.continue, {desc = '[DAP] continue'})
    vim.keymap.set('n', '<F4>', dap.step_over, {desc = '[DAP] step over'})
    vim.keymap.set('n', '<F3>', dap.step_into, {desc = '[DAP] step into'})
    vim.keymap.set('n', '<F2>', dap.step_out, {desc = '[DAP] Step out'})

    -- dap breakpoints
    vim.keymap.set('n', '<leader>bp', dap.toggle_breakpoint, {desc = '[DAP] Toggle breakpoint'})
    vim.keymap.set('n', '<F1>', dapui.toggle, { desc = 'Debug: See last session result.' })

    -- dap python config
    require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
  end,
}
