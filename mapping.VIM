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
nnoremap <leader>x :x<CR> 
"map para resetear configuracion de nvim
nnoremap <leader>r :so %<CR>

"para NeoTree
nnoremap <leader>t :Neotree filesystem reveal right<CR>

"para usar git en nvim
nnoremap <leader>gv :GV<CR>
nnoremap <leader>gb :GBrowse<CR>
nnoremap <leader>ga :Git add
nnoremap <leader>gc :Git commit -m "" 
nnoremap <leader>gp :Git push
nnoremap <leader>gl :Git pull
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gf :Git fetch<CR>

"maps para copilot
"sugerencia anterior 
imap hh <M-[>
"siguiente sugerencia
imap jj <M-]>
"denegar sugerencia
imap kk <C-]>




