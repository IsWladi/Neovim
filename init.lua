require("settings")
require("keymaps")

--Lazy install

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

local makeConfig = true --poner como false si estas instalando esta configuración para que no hayan errores al instalar los plugins, despues de instalados todos, poner makeConfig como true
function DoConfig() 
  if makeConfig == true then
      --activar autopair
      require("nvim-autopairs").setup {}
      --activar neotree
      require("neo-tree").setup()

      --inicio lsp configuración 
      require("nvim-lsp-installer").setup()
      require'lspconfig'.jedi_language_server.setup{} --python
      require'lspconfig'.tsserver.setup{} --javaScript, typeScript
      require'lspconfig'.html.setup{} --html
      require'lspconfig'.cssls.setup{} --css
      --lsp completado con COQ
      vim.cmd("COQnow")
      --vim.cmd('source coqKeymaps.vim')

      --lsp keymaps
      map("n", "<leader>g", ":lua vim.lsp.buf.hover()<CR>") -- mostrar documentacion 
      map("n", "<leader>c", ":lua vim.lsp.buf.definition()<CR>") -- goto definition 

      -- fin lsp configuración

      --inicio telescope config
      vim.keymap.set('n', '<leader>f', ":Telescope find_files<CR>")
      vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>")
      --fin telescope config
      
      --tema
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd([[colorscheme gruvbox]])
      --fin tema
  end
end

DoConfig()


