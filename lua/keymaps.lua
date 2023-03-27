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
map('n', '<leader>q',         ':q<CR>') --salir
map('n', '<leader>a',         ':bdelete<CR>') --borrar buffer actual
map('n', '<leader><leader>a', ':%bd|e#|bd#') --borrar todos los buffers excepto el actual

map('n', '<leader>o',         ':w<CR>') --guardar
map('n', '<leader><leader>o', ':wa<CR>') --guardar todos los buffers
vim.api.nvim_set_keymap('n', '<leader>fw', [[:lua require('utils').formatWrite()<CR>]], { noremap = true, silent = true })

map('n', '<leader>n',         ':bnext<CR>')
map('n', '<leader>t',         ':bprevious<CR>')

map("n", "<leader>u",         ':so %<CR>') --recargar archivo

--bajar y subir media pagina
vim.keymap.set('n', '<C-d>',      '<C-d>zz')
vim.keymap.set('n', '<C-u>',      '<C-u>zz')
--buscar y centrar con m en vez de n
vim.keymap.set("n", "m",          "nzz")
vim.keymap.set("n", "M",          "Nzz")
--para normal mode, no highlight
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

--para normal mode y visual mode, sustituciones con very very magic
map('n', '<leader>/', ':%s/\\v//g')
map('v', '<leader>/', ':s/\\v//g')

-- change tabulations
map('v', '<', '<gv')
map('v', '>', '>gv')

--move lines
map('n','<A-n>',':m .+1<CR>==')
map('n','<A-t>',':m .-2<CR>==')

--tests

-- Crea un archivo
vim.api.nvim_set_keymap('n', '<leader>cf', [[:lua require('utils').create_file()<CR>]], { noremap = true, silent = true })

-- Renombra un archivo
vim.api.nvim_set_keymap('n', '<leader>rf', [[:lua require('utils').rename_file()<CR>]], { noremap = true, silent = true })

-- Elimina un archivo
vim.api.nvim_set_keymap('n', '<leader>df', [[:lua require('utils').delete_current_file()<CR>]], { noremap = true, silent = true })

-- Telescope test 
--vim.api.nvim_set_keymap('n', '<leader>gt', [[:lua require('utils').search_git_root()<CR>]], { noremap = true, silent = true })
