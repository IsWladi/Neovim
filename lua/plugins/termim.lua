return {
  {
    '2kabhishek/termim.nvim',
    keys = {'<leader>l'},

    config = function()
      vim.keymap.set('n', '<leader>l', ":STerm<CR>", {desc = '[Termim] open horizontal split terminal'})
    end,
  },
}
