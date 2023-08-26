return{
  -- Copilot es un plugin que nos ayuda a escribir codigo de manera mas rapida.
  {'https://github.com/github/copilot.vim',
    lazy = false,
    priority = 500,
    config = function()
      vim.api.nvim_set_keymap('n', '<Space>c', ':Copilot panel<CR>', {noremap = true, desc = "[copilot] panel of solutions"})
      vim.api.nvim_set_keymap('n', '<Space>cn', ']]', {noremap = true, desc = "[copilot] next solution"})
      vim.api.nvim_set_keymap('n', '<Space>cp', '[[', {noremap = true, desc = "[copilot] previus solution"})
      vim.api.nvim_set_keymap('i', '<Tab>', '    ', {noremap = true, desc = "[copilot] without tab to acept solution"})
      vim.cmd [[
        imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
        let g:copilot_no_tab_map = v:true
      ]]
    end,
  }
}
