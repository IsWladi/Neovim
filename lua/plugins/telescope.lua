return {
  {'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    config = function()
      --telescope
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<CR>fk', builtin.keymaps, {desc = '[telescope] Show keymaps'})
      vim.keymap.set('n', '<CR><Space>', builtin.buffers, {desc = '[telescope] Show currents buffers'})

      --treesiter
      vim.keymap.set('n', '<CR>ft', builtin.treesitter, {desc = '[TREESITTER telescope] list var, params and functions with treesiter'})

      --git
      vim.keymap.set('n', '<CR>gb', builtin.git_branches, {desc = '[GIT telescope] Make branch actions'})
      vim.keymap.set('n', '<CR>gs', builtin.git_status, {desc = '[GIT telescope] List git status'})
      vim.keymap.set('n', '<CR>gcb', builtin.git_bcommits, {desc = '[GIT telescope] List git commits'})
      vim.keymap.set('n', '<CR>gc', builtin.git_commits, {desc = '[GIT telescope] List all git commits'})

      --lsp
      vim.keymap.set('n', '<leader>i', builtin.lsp_implementations, {desc = '[LSP telescope] go to implementation'})
      vim.keymap.set('n', '<leader>d', builtin.lsp_definitions, {desc = '[LSP telescope] go to definition'})
      vim.keymap.set('n', '<leader>ee', builtin.diagnostics, {desc = '[LSP telescope] diagnostic of all buffers'})
      vim.keymap.set('n', '<leader>r', builtin.lsp_references, {desc = '[LSP telescope] references of word under cursor'})
      vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, {desc = '[LSP telescope] references of symbols in current buffer'})
    end,
  },
}
