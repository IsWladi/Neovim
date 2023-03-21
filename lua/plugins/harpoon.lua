return {
  {'ThePrimeagen/harpoon',
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      vim.keymap.set("n", "<leader>ha", mark.add_file)
      vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu)
      vim.keymap.set("n", "<leader><leader>r", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<leader><leader>t", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<leader><leader>n", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<leader><leader>s", function() ui.nav_file(4) end)
  end,
  },
}
