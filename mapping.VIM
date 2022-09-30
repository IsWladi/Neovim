" mapear imap ii para salir de insert mode
imap ii <Esc>

"para autocompletado 
imap yy <C-y>



"mappings con leader key
let mapleader = "," " Mapear la tecla <leader> a la coma

"para comandos nativos de neovim
" Mapear <leader>q para cerrar el buffer actual
nnoremap <leader>q :q<CR>
" Mapear <leader>w para guardar el buffer actual
nnoremap <leader>w :w<CR>
"mapear <leader>x para cerrar y guardar la ventana actual
nnoremap <leader>e :x<CR> 
"map para resetear configuracion de nvim
nnoremap <leader>r :so %<CR>

"para NeoTree
nnoremap <leader>t :Neotree filesystem reveal right<CR>

"para usar GIT en nvim
let mapleader = " "
nnoremap <leader>q :Git fetch<CR>
nnoremap <leader>w :Git pull
nnoremap <leader>e :Git add
nnoremap <leader>r :Git commit -m 
nnoremap <leader>a :Git push
nnoremap <leader>s :G<CR> 
nnoremap <leader>d :GV<CR>
nnoremap <leader>f :GBrowse<CR>
"maps para copilot
"sugerencia anterior 
imap hh <M-[>
"siguiente sugerencia
imap jj <M-]>
"denegar sugerencia
imap kk <C-]>

"maps para gestionar ventanas
let mapleader = "."
nnoremap <leader>q :tabnew
nnoremap <leader>w :tabclose<CR>
"ir a la siguiente pestaña
nnoremap <leader>r gt<CR> 
"ir a la pestaña anterior
nnoremap <leader>e gT<CR> 
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

