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
    dependencies = {
      {"Wladimir3984/gittory",
        config = function()
          gittory = require("gittory")
          vim.keymap.set("n", "<leader>fd", 
                        function() gittory.search_git_root() end,
                        { noremap = true, silent = true, desc = '[telescope gittory] search git workdirectory' }
                        )
        end
      }
    },
    config = function()
      --telescope
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>f', builtin.find_files, {desc = '[telescope] Find files to subdirectories'})
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, {desc = '[telescope] Show keymaps'})
      vim.keymap.set('n', '<leader>fb', builtin.git_branches, {desc = '[telescope] Make branch actions'})
      vim.keymap.set('n', '<leader>fg', function()
        builtin.grep_string({ search = vim.fn.input("buscame algo po > ") })
      end, {desc = '[telescope] Finde lines with grep'})
      --fin telescope
    end,
  },
}
