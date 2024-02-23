return {
  {
    '2kabhishek/termim.nvim',
    config = function()
      vim.keymap.set('n', '<leader>l', ":STerm<CR>", {desc = '[Termim] open horizontal split terminal'})
    end,
  },
}
