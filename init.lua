require("settings")
require("keymaps")

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
  --estilo para el codigo
  {'sheerun/vim-polyglot'},
  --identacion
  {'lukas-reineke/indent-blankline.nvim'},
  --Plug para ver que lineas tienen cambios en git
  {'mhinz/vim-signify'},
  --coc para autocompletado
  {'neoclide/coc.nvim'},
  --github copilot
  {'https://github.com/github/copilot.vim'},
  --para cambiar parentesis, llaves, corchetes de forma automatica
  {'tpope/vim-surround'},

  --Colorscheme
  {'savq/melange'},
  --autocompletar parentesis
  {'windwp/nvim-autopairs'},
  
  --diseño barrita de abajo
  {'vim-airline/vim-airline'},
  
  --navegar por archivos con nvimtree
  {'nvim-neo-tree/neo-tree.nvim'},
  
  --para html
  {'mattn/emmet-vim'},
})

--Plugins configuration

--activar autopair
require("nvim-autopairs").setup {}


