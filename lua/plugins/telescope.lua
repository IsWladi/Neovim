return {
  -- Para buscar archivos con fzf y rg de manera rapida
  {'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    lazy = true,
    keys = {
      {"<CR>fk"},
      {"<CR><Space>"},
      {"<CR>f"},
      {"<CR>fg"},
      {"<CR>", mode = "v"},
      {"<CR>ft"},
      {"<CR>gb"},
      {"<CR>gs"},
      {"<CR>gcb"},
      {"<CR>gc"},
      {"<leader>i"},
      {"<leader>d"},
      {"<leader>ee"},
      {"<leader>r"},
      -- it´s for manage files and folders in replacement of neotree
      {"<leader>bb",
      function()
        require("telescope").extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true })
      end,
      desc = "Telescope file browser"
    }
    },

    event = 'VeryLazy',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
       },

    config = function()
      --telescope
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<CR>fk', builtin.keymaps, {desc = '[telescope] Show keymaps'})
      vim.keymap.set('n', '<CR><Space>', builtin.buffers, {desc = '[telescope] Show currents buffers'})
      vim.keymap.set('n', '<CR>f', builtin.find_files, {desc = '[telescope] Show currents buffers'})
      vim.keymap.set('n', '<CR>fg', builtin.live_grep, {desc = '[telescope] Show currents buffers'})
      vim.api.nvim_set_keymap('v', '<CR>', ':lua require("telescope.builtin").grep_string({ use_regex = true })<CR>', { noremap = true, silent = true })

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
    end,
  },
}

