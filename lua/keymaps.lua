-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- format on save
function FormatWrite()
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
    end

end

--Map leader

local g     = vim.g
g.mapleader = ','

--remap hjkl
map('n', 'r', '<Left>')
map('n', 't', '<Down>')
map('n', 'n', '<Up>')
map('n', 's', '<Right>')

--para comandos nativos de neovim

--buffers
map('n', '<leader>q', ':q<CR>', {desc = '[keymaps] Exit'}) --salir
map('n', '<leader>a', ':bdelete<CR>', {desc = '[keymaps] Delete current buffer'}) --borrar buffer actual
map('n', '<leader><leader>a', [[:lua require('utils').save_delete_buffers_except_current()<CR>]], { noremap = true, silent = true, desc = '[keymaps] Save and delete all buffers except current'})

map('n', '<leader>o', ':w<CR>', {desc = '[keymaps] Save'}) --guardar
map('n', '<leader><leader>o', ':wa<CR>', {desc = '[keymaps] Save all buffers'}) --guardar todos los buffers
map('n', '<leader>fw', [[:lua require('utils').formatWrite()<CR>]], { noremap = true, silent = true, desc = '[keymaps] Format on save' })

map('n', '<leader>n', ':bnext<CR>', {desc = '[keymaps] Go to next buffer'})
map('n', '<leader>t', ':bprevious<CR>', {desc = '[keymaps] Go to previous buffer'})

map("n", "<leader>u", ':so %<CR>', {desc = '[keymaps] Reload file'}) --recargar archivo

--bajar y subir media pagina
map('n', '<C-d>', '<C-d>zz', {desc = '[keymaps] Scroll down half a page and recenter'})
map('n', '<C-u>', '<C-u>zz', {desc = '[keymaps] Scroll up half a page and recenter'})
--buscar y centrar con m en vez de n
map("n", "m", "nzz", {desc = '[keymaps] Search for next match and recenter'})
map("n", "M", "Nzz", {desc = '[keymaps] Search for previous match and recenter'})
--para normal mode, no highlight
map("n", "<leader>nh", ":nohl<CR>", {desc = '[keymaps] Remove search highlight'})

--para normal mode y visual mode, sustituciones con very very magic
map('n', '<leader>/', ':%s/\\v//g', {desc = '[keymaps] Substitute in normal mode using very magic'})
map('v', '<leader>/', ':s/\\v//g', {desc = '[keymaps] Substitute in visual mode using very magic'})

-- change tabulations
map('v', '<', '<gv', {desc = '[keymaps] Indent left and reselect'})
map('v', '>', '>gv', {desc = '[keymaps] Indent right and reselect'})

--move lines
--map('n','<A-n>',':m .+1<CR>==')
--map('n','<A-t>',':m .-2<CR>==')

--tests

-- Crea un archivo
map('n', '<leader>cf', [[:lua require('utils').create_file()<CR>]], { noremap = true, silent = true, desc = '[keymaps] Create a file' })

-- Renombra un archivo
map('n', '<leader>rf', [[:lua require('utils').rename_file()<CR>]], { noremap = true, silent = true, desc = '[keymaps] Rename a file' })

-- Elimina un archivo
map('n', '<leader>df', [[:lua require('utils').delete_current_file()<CR>]], { noremap = true, silent = true, desc = '[keymaps] Delete current file' })
