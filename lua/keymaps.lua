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
    local ft = vim.bo.filetype
    vim.cmd("w")
    --autopep8 python
    if ft == "python" then
        vim.cmd("!autopep8 --in-place %")
    --prettier html css js markdown
    elseif ft == "html" then
        vim.cmd("!npx prettier --write %")
    elseif ft == "css" then
        vim.cmd("!npx prettier --write %")
    elseif ft == "javascript" then
        vim.cmd("!npx prettier --write %")
    elseif ft == "markdown" then
        vim.cmd("!npx prettier --write %")
    end

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

--visual bloque is ctrl + alt + v

--Mapear <leader>q para cerrar el buffer actual
map("n", "<leader>a", ":q<CR>")
--guardar y formatear segun el lenguaje y que este soportado por funcion FormatWrite()
map("n", "<leader>o", ":lua FormatWrite()<CR>")
--guardar sin formatear
map("n", "<leader>oo", ":w<CR>")
--para NeoTree
map("n", "<leader>e", ":Neotree filesystem reveal right<CR>")
--map para resetear configuracion de nvim
map("n", "<leader>u", ":so %<CR>")

--aps para gestionar ventanas
map("n", "<leader>r", ":tabnew")
map("n", "<leader>t", ":tabclose<CR>")
--r a la siguiente pestaña
map("n", "<leader>n", "gt<CR>") 
--r a la pestaña anterior
map("n", "<leader>s", "gT<CR>") 

--bajar y subir media pagina
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--buscar y centrar con N
vim.keymap.set("n", "N", "Nzz")




