return{
	  --lsp para autocompletado
  {'neovim/nvim-lspconfig',
    dependencies = {
      {'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
          -- LSP Support
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp',
          dependencies = {
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-cmdline'},
            {'petertriho/cmp-git'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
          }
        },
        }
      },
    },
    config = function()
      local lsp = require("lsp-zero")

      lsp.preset("recommended")

      lsp.ensure_installed({
        'tsserver',
        'jedi_language_server', -- apt install python3.10-venv
        'tailwindcss',
        'lua_ls',
        'jsonls', -- en prueba
        'dockerls', -- funciona bien, corrige sintaxis
        'yamlls',
        'html',
        "jdtls",
      })

      lsp.configure('lua-language-server', {
          settings = {
              Lua = {
                  diagnostics = {
                      globals = { 'vim' }
                  }
              }
          }
      })

      lsp.configure('tailwindcss', {
        filetypes = { 'css' }
      })

      local cmp          = require('cmp')
      local cmp_select   = {behavior = cmp.SelectBehavior.Select}
      local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-o>']        = cmp.mapping.select_prev_item(cmp_select),
        ['<C-e>']        = cmp.mapping.select_next_item(cmp_select),
        ['<C-a>']        = cmp.mapping.confirm({ select = true }),
        -- desactivar comportamientos indeseados
        ['<Tab>']   = function(fallback) fallback() end,
        ['<S-Tab>'] = function(fallback) fallback() end,
        ['<CR>']    = function(fallback) fallback() end,
        ['<Up>']    = function(fallback) fallback() end,
        ['<Down>']  = function(fallback) fallback() end,
        ['<Left>']  = function(fallback) fallback() end,
        ['<Right>'] = function(fallback) fallback() end,
      })

      cmp_mappings['<Tab>']   = nil
      cmp_mappings['<S-Tab>'] = nil

      -- Fix mappings for luasnip with dvorak movement keys
      _G.is_snippet_running = false -- flag to check if a snippet is running
      local utils = require('lua.utils')
      cmp.event:on('confirm_done', function() -- when a completion is confirmed: disable rtns remap
        utils.disable_rtns_mappings()
        _G.is_snippet_running = true -- it means that a snippet is running or a completion is confirmed
      end)
      -- when ESC is pressed: enable rtns remap
      vim.keymap.set({'i', 'v'}, '<Esc>', function ()
          if _G.is_snippet_running then -- only call the function when is necessary
              _G.is_snippet_running = false
              utils.enable_rtns_mappings()
              print('Snippet has been finished!')
          end
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
      end, { noremap = true, silent = false })
      -- Fix mappings for luasnip with dvorak movement keys

      lsp.setup_nvim_cmp({
        mapping = cmp_mappings,
        sources = {
          {name = 'nvim_lsp'},
          {name = 'luasnip'},
          {name = 'path'},
          {name = 'cmp_git'},
          {name = 'nvim_lua'},
          {name = 'buffer'},
        },
        -- Enable luasnip to handle snippet expansion for nvim-cmp
        snippet = {
          expand = function(args)
            require ( "luasnip").lsp_expand(args.body)
          end,
        },
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' },   -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
            { name = 'buffer' },
          }, {
            { name = 'luasnip' },
          })
      })

      require("cmp_git").setup() -- setup cmp-git

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            { name = 'cmdline' }
          })
      })

      lsp.set_preferences({
          suggest_lsp_servers = false,
          sign_icons          = {
              error           = 'E',
              warn            = 'W',
              hint            = 'H',
              info            = 'I'
          }
      })

      lsp.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}
        local hover = "[LSP] Hover"
        local diagnostic = "[LSP] Diagnostic"
        local restart = "[LSP] Restart"
        local definition = "[LSP] Definition"
        local type_definition = "[LSP] Type Definition"
        local implementation = "[LSP] Implementation"
        local rename = "[LSP] Rename"
        local code_action = "[LSP] Code Action"

        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = 0, remap = false, desc = hover})
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {buffer = 0, remap = false, desc = definition})
        vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, {buffer = 0, remap = false, desc = type_definition})
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, {buffer = 0, remap = false, desc = implementation})
        vim.keymap.set("n", "<CR>e", function() vim.diagnostic.goto_next() end, {buffer = 0, remap = false, desc = diagnostic})
        vim.keymap.set("n", "<CR>r", function() vim.lsp.buf.rename() end, {buffer = 0, remap = false, desc = rename})
        vim.keymap.set("n", "<CR>ca", function() vim.lsp.buf.code_action() end, {buffer = 0, remap = false, desc = code_action})
      end)

      lsp.setup()

      vim.diagnostic.config({
          virtual_text = true
})
    end
  },
}
