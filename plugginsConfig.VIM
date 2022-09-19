"activar autopair
lua << EOF
require("nvim-autopairs").setup {}

--tabby config for pestañas
vim.o.showtabline = 2
require("tabby").setup({
    tabline = require("tabby.presets").tab_with_top_win,
})



EOF


