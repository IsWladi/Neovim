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
    vim.cmd("w")
    if vim.bo.filetype == "python" then
        vim.cmd("!autopep8 --in-place %")
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
--Mapear <leader>q para cerrar el buffer actual
map("n", "<leader>a", ":q<CR>")
--guardar y formatear segun el lenguaje y que este soportado por funcion FormatWrite()
map("n", "<leader>o", ":lua FormatWrite()<CR>")
--para NeoTree
map("n", "<leader>e", ":Neotree filesystem reveal right<CR>")
--map para resetear configuracion de nvim
map("n", "<leader>u", ":so %<CR>")

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
map("n", "<leader>g", ":lua vim.lsp.buf.hover()<CR>") -- mostrar documentacion 
map("n", "<leader>c", ":lua vim.lsp.buf.definition()<CR>") -- goto definition 

--telescope
vim.keymap.set('n', '<leader>f', ":Telescope find_files<CR>")
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>")

