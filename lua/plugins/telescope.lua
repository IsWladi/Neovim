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
      vim.api.nvim_set_keymap('n', '<leader>f', [[:lua require('utils').search_git_root()<CR>]], { noremap = true, silent = true, desc = '[telescope] Search files in the current git repository' })
      vim.keymap.set('n', '<leader>fa', builtin.find_files, {desc = '[telescope] Find files to subdirectories'})
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, {desc = '[telescope] Show keymaps'})
      vim.keymap.set('n', '<leader>fg', function()
        builtin.grep_string({ search = vim.fn.input("buscame algo po > ") })
      end, {desc = '[telescope] Finde lines with grep'})
      --fin telescope
    end,
  },
}
