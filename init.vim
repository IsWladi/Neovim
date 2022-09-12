
call plug#begin()
  
  "coc para autocompletado
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "github copilot
  Plug 'https://github.com/github/copilot.vim'

" Colorscheme
  Plug 'joshdick/onedark.vim'
  
  "autocompletar parentesis
  Plug 'windwp/nvim-autopairs'

call plug#end()


  
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


"Configuración para LSP y autocompletado copiada de https://dev.to/vonheikemen/configurando-el-cliente-lsp-nativo-de-neovim-en-2022-la-manera-facil-3c17



















