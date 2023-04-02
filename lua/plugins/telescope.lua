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
      vim.keymap.set('n', '<leader>fg', function()
        builtin.grep_string({ search = vim.fn.input("buscame algo po > ") })
      end, {desc = '[telescope] Finde lines with grep'})

      --treesiter
      vim.keymap.set('n', '<leader>ft', builtin.treesitter, {desc = '[telescope] list var, params and functions with treesiter'})

      --git
      vim.keymap.set('n', '<leader>fb', builtin.git_branches, {desc = '[telescope] Make branch actions'})

      --lsp
      vim.keymap.set('n', '<leader>i', builtin.lsp_implementations, {desc = '[telescope] go to implementation'})
      vim.keymap.set('n', '<leader>d', builtin.lsp_definitions, {desc = '[telescope] go to definition'})
      vim.keymap.set('n', '<leader>ee', builtin.diagnostics, {desc = '[telescope] diagnostic of all buffers'})
      vim.keymap.set('n', '<leader>r', builtin.lsp_references, {desc = '[telescope] references of word under cursor'})
    end,
  },
}
