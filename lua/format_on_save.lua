local M = {}

-- format on save
function M.formatWrite()
    local ft = vim.bo.filetype
    if vim.fn.expand('%') ~= '' then
        vim.cmd('w')
    else
        return
    end
    --autopep8 python
    if ft == 'python' then
        vim.cmd('!autopep8 --in-place %')
    --prettier html css js markdown
    elseif ft == 'yaml' or ft == 'html' or ft == 'css' or ft == 'scss' or ft == 'javascript' or ft == 'markdown' or ft == 'typescript' or ft == 'json' then
        vim.cmd('!npx prettier --write %')
    else
        return
    end
end

return M
