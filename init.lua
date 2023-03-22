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

require("lazy").setup("plugins") --instalar los plugins de lua/plugins y algunas de sus configuraciones

--una vez instalados los plugins se carga la configuracion de los mismos

--lsp

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'jedi_language_server',
  'html',
  'cssls',
  'sqlls', --en prueba, se demora en instalar, es pesado parece, no corrige syntaxys
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-e>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-u>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "<leader>g", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>c", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>x", function() vim.diagnostic.goto_next() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
