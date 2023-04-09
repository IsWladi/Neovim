return{
{"Wladimir3984/xdeps",
  config = function()
    xdeps = require("xdeps")
    xdeps.tools = {
       { check  = "python",
         install_command = nil,
         method = "windows_admin",
         desc = "python for autopep8"
       },

       { check = "autopep8",
         install_command = "pip install autopep8",
         method = "windows_admin",
         father = "python",
         desc = "autopep8 for formatting"
       },

       { check  = "node",
         install_command = nil,
         method = "windows_admin",
         desc = "node for install prettier"
       },

       { check = "prettier",
         install_command = "npm install --global prettier",
         method = "windows_admin",
         father = "node",
         desc = "prettier for formatting"
       },

       { check  = "choco",
         install_command = nil,
         method = "windows_admin",
         desc = "chocolatey for installing things"
       },

       { check = "rg",
         install_command = "choco install ripgrep",
         method = "windows_admin",
         father = "choco",
         desc = "ripgrep for telescope"
       },

       { check = "fzf",
         install_command = "choco install fzf",
         method = "windows_admin",
         father = "choco",
         desc = "fzf for telescope"
       },

       { check = "mingw32-make",
         install_command = "choco install mingw",
         method = "windows_admin",
         father = "choco",
         desc = "mingw for treesiter on windows_admindows"
       },
                  }
    vim.keymap.set("n", "<leader><leader>ch",
                  function() xdeps.check_tools() end,
                  { noremap = true, silent = true, desc = '[xdeps] Check external tools and install it' }
                  )
    end
  }

}
