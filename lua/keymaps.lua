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
map('n', '<leader>q', ':q<CR>', {desc = '[no plugin] Exit'}) --salir
map('n', '<leader>a', ':bdelete<CR>', {desc = '[no plugin] Delete current buffer'}) --borrar buffer actual
map('n', '<leader><leader>a', [[:lua require('utils').save_delete_buffers_except_current()<CR>]], { noremap = true, silent = true, desc = '[no plugin] Save and delete all buffers except current'})

map('n', '<leader>o', ':w<CR>', {desc = '[no plugin] Save'}) --guardar
map('n', '<leader><leader>o', ':wa<CR>', {desc = '[no plugin] Save all buffers'}) --guardar todos los buffers
map('n', '<leader>fw', [[:lua require('utils').formatOnSave()<CR>]], { noremap = true, silent = true, desc = '[no plugin] Format on save' })

map('n', '<leader>n', ':bnext<CR>', {desc = '[no plugin] Go to next buffer'})
map('n', '<leader>t', ':bprevious<CR>', {desc = '[no plugin] Go to previous buffer'})

map("n", "<leader>u", ':so %<CR>', {desc = '[no plugin] Reload file'}) --recargar archivo

--bajar y subir media pagina
map('n', '<C-d>', '<C-d>zz', {desc = '[no plugin] Scroll down half a page and recenter'})
map('n', '<C-u>', '<C-u>zz', {desc = '[no plugin] Scroll up half a page and recenter'})
--buscar y centrar con m en vez de n
map("n", "m", "nzz", {desc = '[no plugin] Search for next match and recenter'})
map("n", "M", "Nzz", {desc = '[no plugin] Search for previous match and recenter'})
--para normal mode, no highlight
map("n", "<leader>nh", ":nohl<CR>", {desc = '[no plugin] Remove search highlight'})

--para normal mode y visual mode, sustituciones con very very magic
map('n', '<leader>/', ':%s/\\v//g', {desc = '[no plugin] Substitute in normal mode using very magic'})
map('v', '<leader>/', ':s/\\v//g', {desc = '[no plugin] Substitute in visual mode using very magic'})

-- change tabulations
map('v', '<', '<gv', {desc = '[no plugin] Indent left and reselect'})
map('v', '>', '>gv', {desc = '[no plugin] Indent right and reselect'})

--move lines
--map('n','<A-n>',':m .+1<CR>==')
--map('n','<A-t>',':m .-2<CR>==')

--tests

-- Crea un archivo
map('n', '<leader>cf', [[:lua require('utils').create_file()<CR>]], { noremap = true, silent = true, desc = '[no plugin] Create a file' })

-- Renombra un archivo
map('n', '<leader>rf', [[:lua require('utils').rename_file()<CR>]], { noremap = true, silent = true, desc = '[no plugin] Rename a file' })

-- Elimina un archivo
map('n', '<leader>df', [[:lua require('utils').delete_current_file()<CR>]], { noremap = true, silent = true, desc = '[no plugin] Delete current file' })

-- Checkear herramientas externas
map('n', '<leader><leader>ch', [[:lua require('xdeps').check_tools()<CR>]], { noremap = true, silent = true, desc = '[no plugin] Check external tools and install it' })







