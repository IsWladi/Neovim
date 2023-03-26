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

return M
