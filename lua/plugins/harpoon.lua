return {
  {'ThePrimeagen/harpoon',
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      if vim.env.KB_LAYOUT == "DVORAK" then
        vim.keymap.set("n", "<Space>ha", mark.add_file, {desc = '[harpoon] Add file to mark'})
        vim.keymap.set("n", "<Space>hm", ui.toggle_quick_menu, {desc = '[harpoon] Toggle quick menu'})
        vim.keymap.set("n", "<Space>r", function() ui.nav_file(1) end, {desc = '[harpoon] Navigate to file 1'})
        vim.keymap.set("n", "<Space>t", function() ui.nav_file(2) end, {desc = '[harpoon] Navigate to file 2'})
        vim.keymap.set("n", "<Space>n", function() ui.nav_file(3) end, {desc = '[harpoon] Navigate to file 3'})
        vim.keymap.set("n", "<Space>s", function() ui.nav_file(4) end, {desc = '[harpoon] Navigate to file 4'})
      elseif vim.env.KB_LAYOUT == "QWERTY" then
        vim.keymap.set("n", "<M-h>a", mark.add_file, {desc = '[harpoon] Add file to mark'})
        vim.keymap.set("n", "<M-h>m", ui.toggle_quick_menu, {desc = '[harpoon] Toggle quick menu'})
        vim.keymap.set("n", "<M-h>h", function() ui.nav_file(1) end, {desc = '[harpoon] Navigate to file 1'})
        vim.keymap.set("n", "<M-h>j", function() ui.nav_file(2) end, {desc = '[harpoon] Navigate to file 2'})
        vim.keymap.set("n", "<M-h>k", function() ui.nav_file(3) end, {desc = '[harpoon] Navigate to file 3'})
        vim.keymap.set("n", "<M-h>l", function() ui.nav_file(4) end, {desc = '[harpoon] Navigate to file 4'})
      end
  end,
  },
}
