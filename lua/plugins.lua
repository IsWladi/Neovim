return{
  --harpoon marks
  {'ThePrimeagen/harpoon',
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      vim.keymap.set("n", "<leader>ha", mark.add_file)
      vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu)
  end,
  },

  --telescope
  {'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    config = function()
      --telescope
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>f', builtin.find_files, {})
      --vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>fg', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
      --vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
      --fin telescope
    end,
  },

  --lsp para autocompletado
  {'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip',
        config = function()

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
                  t("-- "), i(1,"A short description of the function"),
                  t({"","CREATE OR REPLACE FUNCTION FN_"}), i(2,"fname"), t("( "), i(3, "param_name TYPE"), t(" )"), 
                  t(" RETURN "), i(4, "TYPE"), t(" IS"),
                  t({"", "-- variable declarations", ""}),
                  t({"BEGIN", ""}), 
                  t("-- function body"),
                  t({"" ,"RETURN "}), t("TRUE"), t(" ;"),
                  t({"","END ;"})
                }),
              s("procedure", {
                  t("-- "), i(1,"A short description of the procedure"),
                  t({"","CREATE OR REPLACE PROCEDURE PROC_"}), i(2,"procedure_name"), t("( "), i(3, "param_name TYPE"), t(" )"), t(" IS"),
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
                }),
              s("cursor", {
                  t("-- "), i(1,"A short description of the cursor"),
                  t({"","CURSOR cur_"}), i(2,"cursor_name"), i(3, "(param_name TYPE)"), t(" IS"),
                  t({"", "  SELECT "}), i(4, "*"), t(" FROM "), i(5, "table_name"), t(" ;")
                })
		  })
            
          -- <c-e> is my expansion key
          -- this will expand the current item or jump to the next item within the snippet.
          vim.keymap.set({ "i", "s" }, "<C-e>", function()
            if ls.expand_or_jumpable() then
              ls.expand_or_jump()
            end
          end, { silent = true })
        end
      },
      {'rafamadriz/friendly-snippets'},
    }
  },

  --estilo para el codigo
  {'sheerun/vim-polyglot'},

  --identacion
  {'lukas-reineke/indent-blankline.nvim'},

  --Plug para ver que lineas tienen cambios en git
  {'mhinz/vim-signify'},

  {'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup()
    end,
  }, 

  --github copilot
  {'https://github.com/github/copilot.vim'},

  --para cambiar parentesis, llaves, corchetes de forma automatica
  {'tpope/vim-surround'},
  {'tpope/vim-repeat'}, --para repetir con "." para comandos no nativos de nvim

  --diseño barrita de abajo
  {'vim-airline/vim-airline'},
  
  --navegar por archivos con nvimtree
  {'nvim-neo-tree/neo-tree.nvim',
    config = function()
      require("neo-tree").setup()
    end,
  },
  {'nvim-lua/plenary.nvim'},
  {'nvim-tree/nvim-web-devicons'},
  {'MunifTanjim/nui.nvim'},

  --para html
  {'mattn/emmet-vim',
    ft = {"html", "css"}
  },

  --pestañas
  {'ap/vim-buftabline'},

  --tema
  {'ellisonleao/gruvbox.nvim'},
}
