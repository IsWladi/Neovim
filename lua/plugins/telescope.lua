return {
  {'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    init = function()
      local telescope = require('telescope')
      telescope.setup{
        defaults = {
          file_ignore_patterns = { '%.git/*' }
        }
      }
    end,
    config = function()
      --telescope
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>f', builtin.find_files, {})
      --vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>fg', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
      --vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
      --fin telescope
    end,
  },
}
