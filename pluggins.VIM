call plug#begin()
 
  "estilo para el codigo
  Plug 'sheerun/vim-polyglot'
  "identacion
  Plug 'lukas-reineke/indent-blankline.nvim'
  "Plug para ver que lineas tienen cambios en git
  Plug 'mhinz/vim-signify'
  "plugin para usar git
  Plug 'tpope/vim-fugitive' " Los comandos de git en vim empiezan con :Git
  "complemento para vim-fugitive
  Plug 'tpope/vim-rhubarb' "GBrowse para abrir el repositorio en github  
  "plugin para ver los commits de git
  Plug 'junegunn/gv.vim' " :GV para ver los commits
  "coc para autocompletado
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "github copilot
  Plug 'https://github.com/github/copilot.vim'
  "para cambiar parentesis, llaves, corchetes de forma automatica
  Plug 'tpope/vim-surround'
  "buscar archivos
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'


" Colorscheme
  Plug 'joshdick/onedark.vim'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'savq/melange'
  "autocompletar parentesis
  Plug 'windwp/nvim-autopairs'
  
  "diseño barrita de abajo
  Plug 'vim-airline/vim-airline'
  
  "navegar por archivos con nvimtree
  Plug 'nvim-neo-tree/neo-tree.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'MunifTanjim/nui.nvim'
  Plug 'nanozuki/tabby.nvim'
  Plug 'lambdalisue/nerdfont.vim'  
  
  "para html
  Plug 'mattn/emmet-vim'
  call plug#end()
