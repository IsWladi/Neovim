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
  Plug 'savq/melange'
  "autocompletar parentesis
  Plug 'windwp/nvim-autopairs'
  
  "diseño barrita de abajo
  Plug 'vim-airline/vim-airline'
  
  "navegar por archivos con nvimtree
  Plug 'nvim-neo-tree/neo-tree.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'MunifTanjim/nui.nvim'
  Plug 'lambdalisue/nerdfont.vim'  
  
  "para html
  Plug 'mattn/emmet-vim'
  call plug#end()

" configuracion de pluggins

"activar autopair
lua << EOF
require("nvim-autopairs").setup {}

EOF




"configuración de neovim

set relativenumber
set clipboard+=unnamedplus "copiar y pegar con el portapapeles del sistema operativo
set encoding=utf-8 " Encoding
set title  " Muestra el nombre del archivo en la ventana de la terminal
set number  " Muestra los números de las líneas
set mouse=a  " Permite la integración del mouse (seleccionar texto, mover el cursor)

set nowrap  " No dividir la línea si es muy larga

set cursorline  " Resalta la línea actual
set colorcolumn=200  " Muestra la columna límite a 120 caracteres

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
colorscheme melange

" mappings dvorak

" mapear imap ii para salir de insert mode
imap ii <Esc>

"para autocompletado 
imap yy <C-y>

"remap hjkl
nnoremap r <Left>
nnoremap t <Down>
nnoremap n <Up>
nnoremap s <Right>

"mappings con leader key
let mapleader = "," " Mapear la tecla <leader> a la coma

"para comandos nativos de neovim
" Mapear <leader>q para cerrar el buffer actual
nnoremap <leader>a :q<CR>
" Mapear <leader>w para guardar el buffer actual
nnoremap <leader>o :w<CR>
"mapear <leader>x para cerrar y guardar la ventana actual
nnoremap <leader>e :x<CR> 
"map para resetear configuracion de nvim
nnoremap <leader>u :so %<CR>
"para NeoTree
nnoremap <leader>d :Neotree filesystem reveal right<CR>
"fuzzy finder
nnoremap <leader>h :FZF<CR>
"fzf Rg
nnoremap <leader>t :Rg<CR>



"para usar GIT en nvim
let mapleader = " "
nnoremap <leader>a :Git fetch<CR>
nnoremap <leader>o :Git pull
nnoremap <leader>e :Git add
nnoremap <leader>u :Git commit -m 
nnoremap <leader>d :Git push
nnoremap <leader>h :G<CR> 
nnoremap <leader>t :GV<CR>
nnoremap <leader>n :GBrowse<CR>
"maps para copilot
"sugerencia anterior 
imap dd <M-[>
"siguiente sugerencia
imap hh <M-]>
"denegar sugerencia
imap tt <C-]>
"aceptar sugerencia coc
imap nn <C-y>

"maps para gestionar ventanas
let mapleader = "."
nnoremap <leader>a :tabnew
nnoremap <leader>o :tabclose<CR>
"ir a la siguiente pestaña
nnoremap <leader>e gt<CR> 
"ir a la pestaña anterior
nnoremap <leader>u gT<CR> 
"ir a la pestaña 1
nnoremap <leader>1 1gt<CR>
"ir a la pestaña 2
nnoremap <leader>2 2gt<CR>
"ir a la pestaña 3
nnoremap <leader>3 3gt<CR>
"ir a la pestaña 4
nnoremap <leader>4 4gt<CR>
"ir a la pestaña 5
nnoremap <leader>5 5gt<CR>
"ir a la pestaña 6
nnoremap <leader>6 6gt<CR>
"ir a la pestaña 7
nnoremap <leader>7 7gt<CR>
"ir a la pestaña 8
nnoremap <leader>8 8gt<CR>

"maps para COC 
"go to definition
nmap <silent> gd <Plug>(coc-definition)












