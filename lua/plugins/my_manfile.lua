return{
  {"Wladimir3984/manfile",
    config = function()
      manfile = require("manfile")
      vim.keymap.set('n', '<leader>cf', function() manfile.create_file() end, { noremap = true, silent = true, desc = '[ manfile ] create a file' })
      vim.keymap.set('n', '<leader>rf', function() manfile.rename_file() end, { noremap = true, silent = true, desc = '[ manfile ] rename a file' })
      vim.keymap.set('n', '<leader>df', function() manfile.delete_current_file() end, { noremap = true, silent = true, desc = '[ manfile ] delete current file' })
      vim.keymap.set('n', '<leader>fw', function() manfile.formatOnSave() end, { noremap = true, silent = true, desc = '[ manfile ] format on save' })

    end
  }
}
