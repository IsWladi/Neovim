return {
  {'nvim-telescope/telescope.nvim',

    tag = '0.1.0',

    dependencies = {
      {"Wladimir3984/gittory",
        dependencies = {
            {"rcarriga/nvim-notify"},
        },
        config = function()
          gittory = require("gittory")
          vim.keymap.set("n", "<CR>ff",
                        function() gittory.search_git_root() end,
                        { noremap = true, silent = true, desc = '[telescope gittory] find files' }
                        )

          vim.keymap.set("n", "<CR>fg",
                        function() gittory.search_git_root(require('telescope.builtin').live_grep) end,
                        { noremap = true, silent = true, desc = '[telescope gittory] live grep' }
                        )
        end
      }
    },
    config = function()
      --telescope
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<CR>fk', builtin.keymaps, {desc = '[telescope] Show keymaps'})
      vim.keymap.set('n', '<CR><Space>', builtin.buffers, {desc = '[telescope] Show currents buffers'})
      vim.keymap.set('n', '<CR>g', function()
        builtin.grep_string({ search = vim.fn.input("buscame algo po > ") })
      end, {desc = '[telescope] Finde lines with grep'})

      --treesiter
      vim.keymap.set('n', '<CR>t', builtin.treesitter, {desc = '[TREESITTER telescope] list var, params and functions with treesiter'})

      --git
      vim.keymap.set('n', '<CR>gb', builtin.git_branches, {desc = '[GIT telescope] Make branch actions'})
      vim.keymap.set('n', '<CR>gs', builtin.git_status, {desc = '[GIT telescope] List git status'})

      --lsp
      vim.keymap.set('n', '<CR>i', builtin.lsp_implementations, {desc = '[LSP telescope] go to implementation'})
      vim.keymap.set('n', '<CR>d', builtin.lsp_definitions, {desc = '[LSP telescope] go to definition'})
      vim.keymap.set('n', '<CR>ee', builtin.diagnostics, {desc = '[LSP telescope] diagnostic of all buffers'})
      vim.keymap.set('n', '<CR>r', builtin.lsp_references, {desc = '[LSP telescope] references of word under cursor'})
      vim.keymap.set('n', '<CR>s', builtin.lsp_document_symbols, {desc = '[LSP telescope] references of symbols in current buffer'})
    end,
  },
}
