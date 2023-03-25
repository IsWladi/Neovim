local M = {}

function M.create_file()
  local filename = vim.fn.input('nuevo archivo > ')
  vim.cmd('!powershell New-Item ' .. filename .. ' -ItemType file')
end

function M.rename_file()
  local oldname = vim.fn.expand('%:p')
  local newname = vim.fn.input('renombrar > ')
  vim.cmd('!powershell Rename-Item ' .. oldname .. ' ' .. newname)
  vim.cmd('file ' .. newname)
  vim.cmd('w!')
  vim.lsp.stop_client(vim.lsp.get_active_clients())
  vim.cmd('e')
end

return M
