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