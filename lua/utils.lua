local M = {}

--install externs tools
function M.install_missing_tools(tools) --python, node and choco must be installed by the user
  if tools then
    for _, tool in ipairs(tools) do
      if tool == "mingw" then
        print("Instalando mingw...")
        vim.cmd([[!powershell -Command "Start-Process powershell -Verb runAs -ArgumentList 'choco install mingw'"]])
      elseif tool == "ripgrep" then
        print("Instalando ripgrep...")
        vim.cmd([[!powershell -Command "Start-Process powershell -Verb runAs -ArgumentList 'choco install ripgrep'"]])
      elseif tool == "fzf" then
        print("Instalando fzf...")
        vim.cmd([[!powershell -Command "Start-Process powershell -Verb runAs -ArgumentList 'choco install fzf'"]])
      elseif tool == "autopep8" then
        print("Instalando autopep8...")
        vim.cmd([[!powershell -Command "Start-Process powershell -Verb runAs -ArgumentList 'pip install autopep8'"]])
      elseif tool == "prettier" then
        print("Instalando prettier...")
        vim.cmd([[!powershell -Command "Start-Process powershell -Verb runAs -ArgumentList 'npm install --global prettier'"]])
      end

      -- Esperar a que el usuario pulse una tecla antes de continuar
      print("Pulse una tecla para continuar...")
      vim.fn.getchar()
      vim.cmd("redraw!")
    end
  else
    print("Todas las herramientas están instaladas.")
  end
end

--check for externs tools

function M.check_for_tools()
  local prettier_installed = vim.fn.executable("prettier") == 1
  local autopep8_installed = vim.fn.executable("autopep8") == 1
  local node_installed     = vim.fn.executable("node") == 1
  local mingw_installed    = vim.fn.executable("mingw32-make") == 1
  local rg_installed       = vim.fn.executable("rg") == 1
  local fzf_installed      = vim.fn.executable("fzf") == 1
  local choco_installed    = vim.fn.executable("choco") == 1
  local python_installed   = vim.fn.executable("python") == 1
  local no_instaladas = {}
  
  if not choco_installed then
    table.insert(no_instaladas, "choco")
    return
  else
    if not mingw_installed then
      table.insert(no_instaladas, "mingw")
    end

    if not rg_installed then
      table.insert(no_instaladas, "ripgrep")
    end

    if not fzf_installed then
      table.insert(no_instaladas, "fzf")
    end
  end

  if not python_installed then
    table.insert(no_instaladas, "python")
  else
    if not autopep8_installed then
      --local choice = vim.fn.input("autopep8 no está instalado. ¿Desea instalarlo? (s/n): ")
      --if choice:lower() == "s" then
      --  vim.cmd([[!powershell -Command "Start-Process powershell -Verb runAs -ArgumentList 'pip install autopep8'"]])
      --end
      table.insert(no_instaladas, "autopep8")
    end
  end

  if not node_installed then
    table.insert(no_instaladas, "node")
  else
    if not prettier_installed then
      --local choice = vim.fn.input("Prettier no está instalado. ¿Desea instalarlo? (s/n): ")
      --if choice:lower() == "s" then
      --  vim.cmd([[!powershell -Command "Start-Process powershell -Verb runAs -ArgumentList 'npm install --global prettier'"]])
      --end
      table.insert(no_instaladas, "prettier")
    end
  end
  
  if #no_instaladas > 0 then --faltan herramientas por instalar
    print("No instaladas: " .. table.concat(no_instaladas, ", "))
    local can_install = true
    for _, tool in ipairs(no_instaladas) do --verifa las herramientas que DEBEN estar instaladas por el usuario
      if tool == "python" or tool == "node" or tool == "choco" then
        can_install = false
        break
      end
    end
    if can_install then
      local choice = vim.fn.input("¿Desea instalar las dependencias externas que le faltan? (s/n): ")
      if choice:lower() == "s" then
         -- Limpiar la pantalla
        vim.cmd("redraw!")
        M.install_missing_tools(no_instaladas)
      else 
        print("Si no instala las depencencias faltantes puede que algunas funciones y/o plugins no funcionen correctamente")
        print("Pulse una tecla para terminar...")
        vim.fn.getchar()
        vim.cmd("redraw!")
      end
    else
      print("Instale chocolatey, python y node.js para instalar las dependencias externas faltantes")
      print("Pulse una tecla para terminar...")
      vim.fn.getchar()
      vim.cmd("redraw!")
    end
  else
    print("Todas las dependencias externas instaladas")
  end
end

--utilidades para el manejo de archivos

function M.create_file()
  local filename = vim.fn.input('nuevo archivo > ')
  if filename ~= '' then
    local current_dir = vim.fn.expand('%:p:h')
    local filepath = current_dir .. '/' .. filename
    local file = io.open(filepath, 'w')
    if file then
      file:close()
      vim.cmd('edit ' .. filepath)
    else
      print('No se pudo crear el archivo')
    end
  end
end

function M.rename_file()
  local oldname = vim.fn.expand('%:p')
  if oldname ~= '' then
    local newname = vim.fn.input('renombrar > ')
    if newname ~= '' then
      local current_dir = vim.fn.expand('%:p:h')
      newname = current_dir .. '/' .. newname
      os.rename(oldname, newname)
      vim.cmd('file ' .. newname)
      vim.cmd('w!')
      vim.lsp.stop_client(vim.lsp.get_active_clients())
      vim.cmd('e')
    end
  else
    print('No hay archivo para renombrar')
  end
end

function M.confirm(prompt)
  local answer = vim.fn.input(prompt)
  if string.lower(answer) == 's' then
    return true
  else
    return false
  end
end

function M.delete_current_file()
  local current_file = vim.fn.expand('%:p')
  if current_file ~= '' and vim.fn.filereadable(current_file) == 1 then
    if M.confirm("¿Estás seguro de que deseas eliminar el archivo actual? (s/n) > ") then
      vim.cmd('w')
      os.remove(current_file)
      vim.cmd('bdelete')
    end
  else
    print('No hay archivo para eliminar')
  end
end

function M.save_delete_buffers_except_current()
  local answer = vim.fn.input("¿Guadar y borrar todos los buffers excepto el actual? (y/n): ")
  if answer == "y" then
    vim.cmd(":wa")
    vim.cmd(":%bd|e#|bd#")
  else
    print("Operación cancelada.")
  end
end

-- format on save
function M.formatWrite_test()
    local ft = vim.bo.filetype
    vim.cmd('w')
    if ft == 'python' then
            vim.cmd('!autopep8 --in-place %')
    elseif ft == 'html' or ft == 'css' or ft == 'javascript' or ft == 'markdown' then
            vim.cmd('!npx prettier --write %')
    else 
        vim.cmd('%s/\\v^?\\s+$//g') --remove spaces at the end of the lines and empty lines(but not delete the line)
        vim.cmd('w')
    end
end

function M.formatOnSave()
    if pcall(M.formatWrite_test) then
        print('Formato correcto')
    else
        print('Error al formatear(posiblemente no tienes prettier o autopep8 instalado)')
    end
end

--Utilidades para plugins

--TELESCOPE

-- Función para buscar el directorio raíz del repositorio de Git
function M.find_git_root()
  local path = vim.loop.cwd()
  local i = 0
  while path:match('.:\\') and i < 10 do
    if vim.fn.isdirectory(path .. '/.git') == 1 then
      return path
    end
    path = vim.fn.fnamemodify(path, ':h')
    i = i + 1
  end
end

-- Función para buscar en todo el directorio de trabajo del repositorio de Git con Telescope
function M.search_git_root()
  local is_git = M.isGitRepository()
  if is_git then
    local git_root = M.find_git_root()
    if git_root then
      require('telescope.builtin').find_files({ cwd = git_root })
    else
      print('El repositorio tiene más de 10 directorios superiores respecto al directorio de trabajo actual')
    end
  else
    print('No es un repositorio de Git')
  end
end

function M.isGitRepository()
  local isGit = os.execute('git status > NUL 2>&1') -- 0 si es un repositorio de Git, 1 si no lo es, el msg de retorno se guarda en NUL(se elimina)
  if type(isGit) == 'number' then --si es lua 5.2 o superior el tipo de retorno es number
    isGit = (isGit == 0)
  end
  if isGit then
    return true
  else
    return false
  end
end



return M
