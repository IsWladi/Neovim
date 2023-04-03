return{
  {'https://github.com/github/copilot.vim',
    config = function()
      vim.api.nvim_set_keymap('i', '<Tab>', '    ', {noremap = true})
      vim.api.nvim_set_keymap('n', '<Space>c', ':Copilot panel<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', '<Space>cn', ']]', {noremap = true})
      vim.api.nvim_set_keymap('n', '<Space>cp', '[[', {noremap = true})
      vim.api.nvim_exec([[
      imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
      let g:copilot_no_tab_map = v:true
]], false)
    end,
  }
}
