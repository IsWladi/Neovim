
call plug#begin()
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

call plug#end()


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

"mapping 
let mapleader = "," " Mapear la tecla <leader> a la coma

"para autocompletado COC, cuidado porque quiza me interfiere con otro comando
:imap ii <Esc>
:imap yy <C-y>



















