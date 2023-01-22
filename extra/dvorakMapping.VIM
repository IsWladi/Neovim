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

