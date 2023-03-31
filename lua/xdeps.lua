
local M = {}

M.tools = {
               { check = "autopep8", install_command = "pip install autopep8", method = "win", desc = "autopep8 for formatting" },
               { check = "prettier", install_command = "npm install --global prettier", method = "win", desc = "prettier for formatting" },
               { check = "rg", install_command = "choco install ripgrep", method = "win", desc = "ripgrep for searching" },
               { check = "fzf", install_command = "choco install fzf", method = "win", desc = "fzf for searching" },
               { check = "node", install_command = nil, method = "win", desc = "node for prettier" },
               { check = "python", install_command = nil, method = "win", desc = "python for autopep8" },
               { check = "mingw32-make", install_command = "choco install mingw", method = "win", desc = "mingw for building" },
               { check = "choco", install_command = nil, method = "win", desc = "chocolatey for installing" },
               --django
               { check= "django-admin", install_command = "pip install django", method = "win", desc = "django for python" },

          }

M.methods = {
                 windows = function(install)
                   vim.cmd([[!powershell -Command "Start-Process powershell -Verb runAs -ArgumentList ']] .. install .. [['"]])
                 end,
            }

function M.check_tools()
  for i, tool in ipairs(M.tools) do
      local check = tool.check
      local install_command = tool.install_command
      local method = tool.method
      local desc = tool.desc
      -- check if tool is installed
      
      local is_installed = vim.fn.executable(check) == 1
      if not is_installed then -- if not installed, ask user if they want to install it
        local choice = vim.fn.input(desc .. [[ is not installed. do you want to install it?(y/n) > ]])
        if choice:lower() == "y" then
          vim.cmd("redraw!")
          if method == "win" or method == "windows" then
            method = "windows"
          else  
            break
          end
          M.methods[method](install_command)
        end
      end
  end

end

return M

