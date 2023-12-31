-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Map leader

local g     = vim.g

g.mapleader = ','
--remap hjkl
map('n', 'r', '<Left>')
map('n', 't', '<Down>')
map('n', 'n', '<Up>')
map('n', 's', '<Right>')
-- rtns in visual mode
map('v', 'r', '<Left>')
map('v', 't', '<Down>')
map('v', 'n', '<Up>')
map('v', 's', '<Right>')
-- rtns in operator pending mode
map('o', 'r', '<Left>')
map('o', 't', '<Down>')
map('o', 'n', '<Up>')
map('o', 's', '<Right>')

--buffers
map('n', '<leader>q', ':q<CR>', {desc = '[no plugin] Exit'}) --salir
map('n', '<leader>a', ':bdelete<CR>', {desc = '[no plugin] Delete current buffer'}) --borrar buffer actual
map('n', '<leader>o', ':w<CR>', {desc = '[no plugin] Save'}) --guardar
map('n', '<leader><leader>o', ':wa<CR>', {desc = '[no plugin] Save all buffers'}) --guardar todos los buffers
map('n', '<leader>n', ':bnext<CR>', {desc = '[no plugin] Go to next buffer'})
map('n', '<leader>t', ':bprevious<CR>', {desc = '[no plugin] Go to previous buffer'})

map("n", "<leader>u", ':so %<CR>', {desc = '[no plugin] Reload file'}) --recargar archivo

-- use jk for replace "r" and till "t"
map('n', 'j', 'r')
map('n', 'J', 'R')
map('n', 'k', 't')
map('n', 'K', 'T')

--para normal mode y visual mode, sustituciones con very very magic
map('n', '<leader>/', ':%s/\\v//g', {desc = '[no plugin] Substitute in normal mode using very magic'})
map('n', '<leader>//', ':g/.*/normal ', {desc = '[no plugin] put normal commands on regex matches'})
map('v', '<leader>/', ':s/\\v//g', {desc = '[no plugin] Substitute in visual mode using very magic'})

-- change tabulations
map('v', '(', '<gv', {desc = '[no plugin] Indent left and reselect'})
map('v', ')', '>gv', {desc = '[no plugin] Indent right and reselect'})

-- NO overwriting default register section, use "x" if you want to delete with overwrite default register
-- "p" command
map('v', 'p', 'pgvy', {desc = '[no plugin] Paste over visually selected area without overwriting default register'})
-- "c" command
map('v', 'c', '\"_c', {desc = '[no plugin] Change selected text without overwriting default register'})
map('n', 'C', '\"_C', {desc = '[no plugin] Change to end of line without overwriting default register'})
map('v', 'C', '\"_C', {desc = '[no plugin] Change to end of line without overwriting default register'})
map('n', 'cc', '\"_cc', {desc = '[no plugin] Change whole line without overwriting default register'})
map('v', 'cc', '\"_cc', {desc = '[no plugin] Change whole line without overwriting default register'})
-- "d" command
map('n', 'd', '\"_d', {desc = '[no plugin] Delete without overwriting default register'})
map('v', 'd', '\"_d', {desc = '[no plugin] Delete without overwriting default register'})
map('n', 'D', '\"_D', {desc = '[no plugin] Delete without overwriting default register'})
map('v', 'D', '\"_D', {desc = '[no plugin] Delete without overwriting default register'})
-- NO overwriting default register section

-- exit terminal mode
map('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true})

--bajar y subir media pagina
map('n', '<C-d>', '<C-d>zz', {desc = '[no plugin] Scroll down half a page and recenter'})
map('n', '<C-u>', '<C-u>zz', {desc = '[no plugin] Scroll up half a page and recenter'})
--buscar y centrar con m en vez de n
map("n", "m", "nzz", {desc = '[no plugin] Search for next match and recenter'})
map("n", "M", "Nzz", {desc = '[no plugin] Search for previous match and recenter'})
--para normal mode, no highlight
map("n", "<leader>nh", ":nohl<CR>", {desc = '[no plugin] Remove search highlight'})
-- format on save
map('n', '<leader>fw', [[:lua require('format_on_save').formatWrite()<CR>]], { noremap = true, silent = true, desc = '[no plugin] Format on save' })
