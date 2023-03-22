return {
  {'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)
      --focus on the window when opened, use let g:undotree_SetFocusWhenToggle = 0
      vim.g.undotree_SetFocusWhenToggle = 1
      if vim.fn.has("persistent_undo") == 1 then
        local target_path = vim.fn.expand("~/.nvim/undodir")

        -- create the directory and any parent directories
        -- if the location does not exist.
        if vim.fn.isdirectory(target_path) == 0 then
            os.execute("mkdir -p " .. target_path)
        end

        vim.o.undodir = target_path
        vim.o.undofile = true
      end
    end,
  },
}

