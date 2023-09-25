return {
  {'mbbill/undotree',
    enabled = true,
    keys = {
      {"<leader>ut"}
    },
    config = function()
      vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)
      --focus on the window when opened, use let g:undotree_SetFocusWhenToggle = 0
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
}

