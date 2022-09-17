call plug#begin()
 
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

" Colorscheme
  Plug 'joshdick/onedark.vim'
  
  "autocompletar parentesis
  Plug 'windwp/nvim-autopairs'
  
  "diseño barrita de abajo
  Plug 'vim-airline/vim-airline'
  
  "en teoria ayuda para colorear el codigo, pero no me funciono muy bien 
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  
  "navegar por archivos con nvimtree
  Plug 'nvim-neo-tree/neo-tree.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'MunifTanjim/nui.nvim'
  
call plug#end()

set relativenumber
set clipboard+=unnamedplus "copiar y pegar con el portapapeles del sistema operativo
set encoding=utf-8 " Encoding
set title  " Muestra el nombre del archivo en la ventana de la terminal
	set number  " Muestra los números de las líneas
set mouse=a  " Permite la integración del mouse (seleccionar texto, mover el cursor)

set nowrap  " No dividir la línea si es muy larga

set cursorline  " Resalta la línea actual
set colorcolumn=120  " Muestra la columna límite a 120 caracteres

" Indentación a 2 espacios
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab  " Insertar espacios en lugar de <Tab>s

set hidden  " Permitir cambiar de buffers sin tener que guardarlos

set ignorecase  " Ignorar mayúsculas al hacer una búsqueda
set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas

set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español

set signcolumn=yes
set termguicolors
colorscheme onedark


"activar autopair
lua << EOF
require("nvim-autopairs").setup {}
EOF



" mapear imap ii para salir de insert mode
:imap ii <Esc>

"para autocompletado 
:imap yy <C-y>



"mappings con leader key

let mapleader = "," " Mapear la tecla <leader> a la coma

" Mapear <leader>q para cerrar el buffer actual
nnoremap <leader>q :q<CR>
" Mapear <leader>w para guardar el buffer actual
nnoremap <leader>w :w<CR>
"para NeoTree
nnoremap <leader>t :Neotree filesystem reveal right<CR>
"para usar git en nvim
nnoremap <leader>gv :GV<CR>
nnoremap <leader>gb :GBrowse<CR>









