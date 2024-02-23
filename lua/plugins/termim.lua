return {
  {
    '2kabhishek/termim.nvim',
    cmd = { 'Fterm', 'FTerm', 'Sterm', 'STerm', 'Vterm', 'VTerm' },
    config = function()
      vim.keymap.set('t', '<leader>q', ":q!", {desc = '[Termim] Exit terminal mode without errors'})
    end,
  },
}
