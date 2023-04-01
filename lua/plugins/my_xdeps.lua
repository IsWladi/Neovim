return{
  {"Wladimir3984/xdeps",
    config = function()
      xdeps = require("xdeps")
      xdeps.tools = {
 { check  = "python", install_command = nil, method = "win", desc = "python for autopep8" },
  { check = "autopep8", install_command = "pip install autopep8", method = "win", father = "python", desc = "autopep8 for formatting" },
 { check  = "node", install_command = nil, method = "win", desc = "node for install prettier" },
  { check = "prettier", install_command = "npm install --global prettier", method = "win", father = "node", desc = "prettier for formatting"},
 { check  = "choco", install_command = nil, method = "win", desc = "chocolatey for installing things" },
  { check = "rg", install_command = "choco install ripgrep", method = "win", father = "choco", desc = "ripgrep for telescope" },
  { check = "fzf", install_command = "choco install fzf", method = "win", father = "choco", desc = "fzf for telescope" },
  { check = "mingw32-make", install_command = "choco install mingw", method = "win", father = "choco", desc = "mingw for treesiter on windows" },
          }
      vim.keymap.set("n", "<leader><leader>ch", function() xdeps.check_tools() end, { noremap = true, silent = true, desc = '[xdeps] Check external tools and install it' })
    end
  }
}
