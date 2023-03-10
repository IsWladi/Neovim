return{
  --estilo para el codigo
  {'sheerun/vim-polyglot'},

  --identacion
  {'lukas-reineke/indent-blankline.nvim'},

  --Plug para ver que lineas tienen cambios en git
  {'mhinz/vim-signify'},

  --lsp para autocompletado
  {'neovim/nvim-lspconfig'},
  {'williamboman/nvim-lsp-installer'},
  {'windwp/nvim-autopairs'}, 
  {'ms-jpq/coq_nvim'},

  --github copilot
  {'https://github.com/github/copilot.vim',
  config = function() --hay que probar si funciona
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  end,
  },

  --para cambiar parentesis, llaves, corchetes de forma automatica
  {'tpope/vim-surround'},
  {'tpope/vim-repeat'}, --para repetir con "." para comandos no nativos de nvim

  --diseño barrita de abajo
  {'vim-airline/vim-airline'},
  
  --navegar por archivos con nvimtree
  {'nvim-neo-tree/neo-tree.nvim'},
  {'nvim-lua/plenary.nvim'},
  {'nvim-tree/nvim-web-devicons'},
  {'MunifTanjim/nui.nvim'},

  --buscar en el proyecto
  {'nvim-telescope/telescope.nvim'},
  {'nvim-telescope/telescope-fzf-native.nvim'},
  {'BurntSushi/ripgrep'},
  
  --para html
  {'mattn/emmet-vim'},

  --pestañas
  {'ap/vim-buftabline'},

  --tema
  {'ellisonleao/gruvbox.nvim'},
}
