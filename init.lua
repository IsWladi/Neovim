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
  vim.keymap.set("i", "<leader>z", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

--snips
--inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

--tema
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
require('gruvbox').setup({
    disable_background = true
})

function ColorMyPencils(color) 
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
--fin tema

--lua snippets
local ls = require "luasnip"
local t = ls.text_node
local i = ls.insert_node
local s = ls.snippet

ls.config.set_config {
  history = true
}

ls.add_snippets("sql", {
s("function", {
    t("-- "), i(4,"A short description of the function"),
    t({"","CREATE OR REPLACE FUNCTION FN_"}), i(1,"fname"), t("( "), i(2, "param_name TYPE"), t(" )"), t(" RETURN "), i(3, "type"), t(" IS"),
    t({"", "-- variable declarations", ""}),
    t({"BEGIN", ""}), 
    t("-- function body"),
    t({"" ,"RETURN "}), t("TRUE"), t(" ;"),
    t({"","END ;"})
  }),
s("procedure", {
    t("-- "), i(3,"A short description of the procedure"),
    t({"","CREATE OR REPLACE PROCEDURE PROC_"}), i(1,"procedure_name"), t("( "), i(2, "param_name TYPE"), t(" )"), t(" IS"),
    t({"", "-- variable declarations", ""}),
    t({"BEGIN", ""}), 
    t("-- procedure body"),
    t({"", "DBMS_OUTPUT.PUT_LINE('+++++++++++++') ;"}),
    t({"","END ;", ""})
      }),
s("anonym", {
    t("-- "), i(1,"A short description of the anonymous block"),
    t({"","SET SERVEROUTPUT ON ;"}),
    t({"","DECLARE"}),
    t({"", "-- variable declarations", ""}),
    t({"BEGIN", ""}), 
    t("-- anonymous function body"),
    t({"", "DBMS_OUTPUT.PUT_LINE('+++++++++++++') ;"}),
    t({"","END ;", ""})
      })
})

-- <c-e> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<C-e>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })


