return{
  {"Wladimir3984/manfile",
    dependencies = {
      {"Wladimir3984/xdeps"},
      {"stevearc/dressing.nvim"},
      {"rcarriga/nvim-notify"}
    },
    config = function()
      manfile = require("manfile")
      vim.keymap.set('n', '<leader>cf', function() manfile.create_file() end, { noremap = true, silent = true, desc = '[ manfile ] create a file' })
      vim.keymap.set('n', '<leader>rf', function() manfile.rename_file() end, { noremap = true, silent = true, desc = '[ manfile ] rename a file' })
      vim.keymap.set('n', '<leader>df', function() manfile.delete_current_file() end, { noremap = true, silent = true, desc = '[ manfile ] delete current file' })
      vim.keymap.set('n', '<leader>sda', function() manfile.save_delete_buffers_except_current() end, { noremap = true, silent = true, desc = '[ manfile ] save and close all buffers except current file' })
      vim.keymap.set('n', '<leader>fw', function() manfile.formatWrite() end, { noremap = true, silent = true, desc = '[ manfile ] format on save' })

    end
  }
}
