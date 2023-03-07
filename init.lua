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

  --lsp para autocompletado
  {'neovim/nvim-lspconfig'},
  {'williamboman/nvim-lsp-installer'},
  {'windwp/nvim-autopairs'}, 
  {'hrsh7th/nvim-cmp'}, 
  {'hrsh7th/cmp-buffer'}, 
  --{'hrsh7th/cmp-ruta'}, 
  {'hrsh7th/cmp-nvim-lua'}, 
  {'hrsh7th/cmp-nvim-lsp'}, 
  {'saadparwaiz1/cmp_luasnip'}, 
  {'onsails/lspkind-nvim'}, 
  {'hrsh7th/cmp-nvim-lsp-signature-help'}, 
  {'ray-x/lsp_signature.nvim'},

  --github copilot
  {'https://github.com/github/copilot.vim'},

  --para cambiar parentesis, llaves, corchetes de forma automatica
  {'tpope/vim-surround'},

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

  --tema
  {'folke/tokyonight.nvim'},
})

local makeConfig = true --poner como false si estas instalando esta configuración para que no hayan errores al instalar los plugins, despues de instalados todos, poner makeConfig como true
function DoConfig() 
  if makeConfig == true then
      --activar autopair
      require("nvim-autopairs").setup {}
      --activar neotree
      require("neo-tree").setup()

      --inicio lsp configuración 
      require("nvim-lsp-installer").setup()
      require("lsp_signature").setup()
      require("lspconfig")["pyright"].setup {
      on_attach = function(client, bufnr)
        require("lsp_signature").on_attach({
          bind = true,
          handler_opts = {
            border = "single"
          }
        })
      end
    }

      --lsp keymaps
      map("n", "<leader>g", ":lua vim.lsp.buf.hover()<CR>") -- mostrar documentacion 
      map("n", "<leader>c", ":lua vim.lsp.buf.definition()<CR>") -- goto definition 

      -- fin lsp configuración

      --inicio telescope config
      vim.keymap.set('n', '<leader>f', ":Telescope find_files<CR>")
      vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>")
      --fin telescope config

      --tema
      vim.cmd[[colorscheme tokyonight]]
      --fin tema
  end
end

DoConfig()


