local M = {}

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

-- format on save
function M.formatWrite()
    local ft   = vim.bo.filetype
    vim.cmd('w')
    --autopep8 python
    if ft     == 'python' then
        vim.cmd('!autopep8 --in-place %')
    --prettier html css js markdown
    elseif ft == 'html' then
        vim.cmd('!npx prettier --write %')
    elseif ft == 'css' then
        vim.cmd('!npx prettier --write %')
    elseif ft == 'javascript' then
        vim.cmd('!npx prettier --write %')
    elseif ft == 'markdown' then
        vim.cmd('!npx prettier --write %')
    else 
        vim.cmd('%s/\\v^?\\s+$//g') --remove spaces at the end of the lines and empty lines(but not delete the line)
        vim.cmd('w')
    end

end

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


function M.save_delete_buffers_except_current()
  local answer = vim.fn.input("¿Guadar y borrar todos los buffers excepto el actual? (y/n): ")
  if answer == "y" then
    vim.cmd(":wa")
    vim.cmd(":%bd|e#|bd#")
  else
    print("Operación cancelada.")
  end
end

return M
