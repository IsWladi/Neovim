local opt = vim.o

--Configuración general

-- opt.statuscolumn = "%@SignCb@%s%=%T%@NumCb@%l %r│%T "
opt.number         = true
opt.relativenumber = true
opt.mouse          = 'a'
opt.ignorecase     = true
opt.smartcase      = true
opt.breakindent    = true
opt.expandtab      = true
opt.tabstop        = 4
opt.softtabstop    = 4
opt.shiftwidth     = 4
opt.smartindent    = true
opt.autoindent     = true
opt.encoding       = "utf-8"
opt.clipboard      = "unnamedplus"
opt.swapfile       = false
opt.termguicolors  = true
opt.hlsearch       = true --resaltado de busqueda con /palabra
opt.incsearch      = true --resaltado de busqueda mientras se escribe con h1search false
opt.colorcolumn    = "120" --columna de marco para no exceder largo de linea
