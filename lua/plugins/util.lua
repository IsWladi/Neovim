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

  --diseño barrita de abajo
  {'vim-airline/vim-airline'},
  
  --pestañas
  {'ap/vim-buftabline'},

  --depends on plugin(in case of)
  {'nvim-lua/plenary.nvim'},
}
