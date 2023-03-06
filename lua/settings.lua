--Configuración inspirada en pagina https://dev.to/vonheikemen/como-crear-tu-primera-configuracion-de-neovim-usando-lua-dah

--Aliases
local cmd = vim.cmd 
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt

--Configuración general
opt.number = true
opt.relativenumber = true
opt.mouse = 'a'
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true --resaltado de busqueda con /palabra
opt.wrap = true 
opt.breakindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.encoding = "utf-8"
opt.clipboard = "unnamedplus"
opt.termguicolors = true
