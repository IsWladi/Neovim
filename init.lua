-- SETTINGS
local opt = vim.o
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
-- SETTINGS

-- KEYMAPS

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
map('n', '<leader>A', ':bdelete!<CR>', {desc = '[no plugin] Force delete current buffer'}) --borrar buffer actual
map('n', '<leader>o', ':w<CR>', {desc = '[no plugin] Save'}) --guardar
map('n', '<leader><leader>o', ':wa<CR>', {desc = '[no plugin] Save all buffers'}) --guardar todos los buffers
map('n', '<leader>n', ':bnext<CR>', {desc = '[no plugin] Go to next buffer'})
map('n', '<leader>t', ':bprevious<CR>', {desc = '[no plugin] Go to previous buffer'})

--for normal mode and visual mode, substitutions with very very magic
map('n', '<leader>/', ':%s/\\v//g', {desc = '[no plugin] Substitute in normal mode using very magic'})
map('n', '<leader>//', ':g/.*/normal ', {desc = '[no plugin] put normal commands on regex matches'})
map('v', '<leader>/', ':s/\\v//g', {desc = '[no plugin] Substitute in visual mode using very magic'})

-- change tabulations
map('v', '(', '<gv', {desc = '[no plugin] Indent left and reselect'})
map('v', ')', '>gv', {desc = '[no plugin] Indent right and reselect'})

-- paste the last yanked text
map("n", "<leader>p", '"0p', {desc = '[no plugin] Paste from register 0'})
map("n", "<leader>P", '"0P', {desc = '[no plugin] Paste from register 0'})
map("v", "<leader>p", '"0p', {desc = '[no plugin] Paste from register 0'})
map("v", "<leader>P", '"0P', {desc = '[no plugin] Paste from register 0'})
-- paste the last yanked text

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
-- KEYMAPS

--Lazy install

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('oil').setup({
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
        },
      })
      vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
    end,
  },
  {'catppuccin/nvim',
    name = "catppuccin",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd.colorscheme "catppuccin-macchiato"
      require('catppuccin').setup({
        transparent_background = true,
      })

      function ColorMyPencils(color)
        color = color or "catppuccin"
        vim.cmd.colorscheme(color)

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

      end

      ColorMyPencils()
    end,
  }

})

