return {
  {'ThePrimeagen/harpoon',
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      vim.keymap.set("n", "<leader>ha", mark.add_file, {desc = '[harpoon] Add file to mark'})
      vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu, {desc = '[harpoon] Toggle quick menu'})
      vim.keymap.set("n", "<leader><leader>r", function() ui.nav_file(1) end, {desc = '[harpoon] Navigate to file 1'})
      vim.keymap.set("n", "<leader><leader>t", function() ui.nav_file(2) end, {desc = '[harpoon] Navigate to file 2'})
      vim.keymap.set("n", "<leader><leader>n", function() ui.nav_file(3) end, {desc = '[harpoon] Navigate to file 3'})
      vim.keymap.set("n", "<leader><leader>s", function() ui.nav_file(4) end, {desc = '[harpoon] Navigate to file 4'})
  end,
  },
}
