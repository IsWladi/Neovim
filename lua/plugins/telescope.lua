return {
  {'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    --init = function()
    --  local telescope = require('telescope')
    --  telescope.setup{
    --    defaults = {
    --      file_ignore_patterns = { '%.git/*' }
    --    }
    --  }
    --end,
    config = function()
      --telescope
      local builtin = require('telescope.builtin')
      vim.api.nvim_set_keymap('n', '<leader>f', [[:lua require('utils').search_git_root()<CR>]], { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fa', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', function()
        builtin.grep_string({ search = vim.fn.input("buscame algo po > ") })
      end)
      --vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
      --fin telescope
    end,
  },
}
