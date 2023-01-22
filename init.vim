"referenciar a init.vim el arcivo donde instale el plugin"
so C:\Users\wiuc2\vimcf\pluggins.VIM
so C:\Users\wiuc2\vimcf\plugginsConfig.VIM
"so C:\Users\wiuc2\vimcf\mapping.VIM
so C:\Users\wiuc2\vimcf\extra\dvorakMapping.VIM "para usar dvorak, falta mucho que mejorar

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








