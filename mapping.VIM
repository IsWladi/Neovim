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
nnoremap <leader>v :GV<CR>
nnoremap <leader>b :GBrowse<CR>
nnoremap <leader>a :Git add
nnoremap <leader>c :Git commit -m 
nnoremap <leader>p :Git push
nnoremap <leader>l :Git pull
nnoremap <leader>d :Git diff<CR>
nnoremap <leader>g :G<CR> 
nnoremap <leader>f :Git fetch<CR>

"maps para copilot
"sugerencia anterior 
imap hh <M-[>
"siguiente sugerencia
imap jj <M-]>
"denegar sugerencia
imap kk <C-]>

"maps para gestionar ventanas
nnoremap <leader>nt :tabnew
nnoremap <leader>ct :tabclose<CR>
nnoremap <leader>ot :tabonly<CR>
"ir a la siguiente pestaña
nnoremap <leader>u gt<CR> 
"ir a la pestaña anterior
nnoremap <leader>y gT<CR> 


