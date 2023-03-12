return{
  --harpoon marks
  {'ThePrimeagen/harpoon',
    config = function() --hay que probar si funciona
      vim.api.nvim_set_keymap("n", "<leader>m", [[<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]], 
        { noremap = true, silent = true, expr = false })

      vim.api.nvim_set_keymap("n", "<leader>ma", [[<Cmd>lua require("harpoon.mark").add_file()<CR>]], 
        { noremap = true, silent = true, expr = false })

      vim.api.nvim_set_keymap("n", "<leader>mn", [[<Cmd>lua require("harpoon.ui").nav_next()<CR>]], 
        { noremap = true, silent = true, expr = false })
      
  end,
  },

  --lsp para autocompletado
  {'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  },

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
  
  --navegar por archivos con nvimtree
  {'nvim-neo-tree/neo-tree.nvim',
    config = function()
      require("neo-tree").setup()
    end,
  },
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
