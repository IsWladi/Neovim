--Configuración inspirada en pagina https://dev.to/vonheikemen/como-crear-tu-primera-configuracion-de-neovim-usando-lua-dah

--Aliases
local cmd  = vim.cmd
local exec = vim.api.nvim_exec
local fn   = vim.fn
local g    = vim.g
local opt  = vim.opt

--Configuración general

opt.number         = true
opt.relativenumber = true
opt.mouse          = 'a'
opt.ignorecase     = true
opt.smartcase      = true
opt.breakindent    = true
opt.tabstop        = 4
opt.shiftwidth     = 4
opt.expandtab      = false
opt.encoding       = "utf-8"
opt.clipboard      = "unnamedplus"
opt.termguicolors  = true
opt.hlsearch       = true --resaltado de busqueda con /palabra
--opt.incsearch      = true --resaltado de busqueda mientras se escribe con h1search false
opt.colorcolumn    = "140" --columna de marco para no exceder largo de linea

--auto comandos
vim.cmd("autocmd BufReadPost * lua require('wrap').set_wrap()") -- auto wrap
vim.cmd('autocmd BufWritePre * :%s/\\v\\s+$//e') --elimina espacios en blanco al final de cada linea
vim.cmd('autocmd BufWritePre * :%s/\\v^(\\n\\s*)+$//e') -- elimina lineas al final del archivo

-- Restaurar la posición del cursor y centrar pantalla
vim.api.nvim_create_autocmd(
  { "BufReadPost" },
  {
    pattern = { "*" },
    callback = function()
      vim.api.nvim_exec('silent! normal! g`"zvzz', false)
    end,
  }
)

