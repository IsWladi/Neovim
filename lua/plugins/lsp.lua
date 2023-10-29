return{
	  --lsp para autocompletado
  {'neovim/nvim-lspconfig',
    event = "VeryLazy",
    dependencies = {
      {'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
          -- LSP Support
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'hrsh7th/cmp-cmdline'},
          {'hrsh7th/cmp-git'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets

          {'rafamadriz/friendly-snippets'},
        }
      },
    },
    config = function()
      local lsp = require("lsp-zero")

      lsp.preset("recommended")

      lsp.ensure_installed({
        'tsserver',
        'jedi_language_server',
        'tailwindcss',
        'lua_ls',
        'jsonls', -- en prueba
        'dockerls', -- funciona bien, corrige sintaxis
        'yamlls',
        'html',
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

      local cmp          = require('cmp')
      local cmp_select   = {behavior = cmp.SelectBehavior.Select}
      local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-o>']        = cmp.mapping.select_prev_item(cmp_select),
        ['<C-e>']        = cmp.mapping.select_next_item(cmp_select),
        ['<M-a>']         = cmp.mapping.confirm({ select = true }),
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

      lsp.setup_nvim_cmp({
        mapping = cmp_mappings,
        sources = {
          {name = 'nvim_lsp'},
          {name = 'path'},
          {name = 'buffer'},
          {name = 'luasnip'},
        }
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },   -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
            { name = 'buffer' },
          })
      })

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

        --vim.keymap.set("n", "<CR>ho", function() vim.lsp.buf.hover() end, {buffer = bufnr, remap = false, desc = hover})

        vim.keymap.set("n", "<CR>e", function() vim.diagnostic.goto_next() end, {buffer = bufnr, remap = false, desc = diagnostic})

        vim.keymap.set("n", "<CR>lr", ":LspRestart<cr>", { noremap = true, desc = restart })
        --vim.keymap.set("n", "<CR>vrn", vim.lsp.buf.rename, { buffer = 0 }) -- no me funciona con .py, habra que probar con otros lenguajes
      end)

      lsp.setup()

      vim.diagnostic.config({
          virtual_text = true
})
    end
  },
}
