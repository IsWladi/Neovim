return{
  --estilo para el codigo
  {'sheerun/vim-polyglot'},

  --identacion
  {'lukas-reineke/indent-blankline.nvim'},

  --Plug para ver que lineas tienen cambios en git
  {'mhinz/vim-signify'},

  {'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup()
    end,
  }, 

  --github copilot
  {'https://github.com/github/copilot.vim'},

  --para cambiar parentesis, llaves, corchetes de forma automatica
  {'tpope/vim-surround'},
  {'tpope/vim-repeat'}, --para repetir con "." para comandos no nativos de nvim

  --diseño barrita de abajo
  {'vim-airline/vim-airline'},
  

  --para html
  {'mattn/emmet-vim',
    ft = {"html", "css"}
  },

  --pestañas
  {'ap/vim-buftabline'},

  --depends on plugin(in case of)
  {'nvim-lua/plenary.nvim'},
}
