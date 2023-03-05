-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- mappings

--mappings dvorak

--Map leader

local g = vim.g
g.mapleader = ","
--mapear imap ii para salir de insert mode
map("i", "ii", "<Esc>")

--para autocompletado 
map("i", "yy", "<C-y>")

--remap hjkl
map("n", "r", "<Left>")
map("n", "t", "<Down>")
map("n", "n", "<Up>")
map("n", "s", "<Right>")

--para comandos nativos de neovim
--Mapear <leader>q para cerrar el buffer actual
map("n", "<leader>a", ":q<CR>")
--para guardar el archivo
map("n", "<leader>o", ":w<CR>")
--para formatear codigo python con autopep8
map("n", "<leader>e", ":!autopep8 --in-place %<CR>") 
--map para resetear configuracion de nvim
map("n", "<leader>u", ":so %<CR>")
--para NeoTree
map("n", "<leader>d", ":Neotree filesystem reveal right<CR>")

--maps para copilot
--ugerencia anterior"
map("i", "dd", "<M-[>")
--iguiente sugerencia
map("i", "hh", "<M-]>")
--enegar sugerencia
map("i", "tt", "<C-]>")
--ceptar sugerencia coc
map("i", "nn", "<C-y>")

--aps para gestionar ventanas
map("n", "<leader>r", ":tabnew")
map("n", "<leader>t", ":tabclose<CR>")
--r a la siguiente pestaña
map("n", "<leader>n", "gt<CR>") 
--r a la pestaña anterior
map("n", "<leader>s", "gT<CR>") 

--para lsp
map("n", "<leader>c", ":lua vim.lsp.buf.hover()<CR>") -- mostrar documentacion 
map("n", "<leader>g", ":lua vim.lsp.buf.definition()<CR>") -- goto definition 
map("n", "<leader>h", ":lua vim.lsp.buf.format()<CR>") -- formatear codigo segun lsp NO FUNCIONA 
map("n", "<leader>l", ":lua vim.lsp.buf.implementation()<CR>") -- goto implementation NO FUNCIONA
