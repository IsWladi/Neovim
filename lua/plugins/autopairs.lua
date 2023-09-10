return {
    -- Para completar los parentesis automaticamente, lo estoy probando en reemplazo de windwp/nvim-autopairs

{
    'altermo/ultimate-autopair.nvim',
    event={'InsertEnter','CmdlineEnter'},
    branch='v0.6',
    opts={
        --Config goes here
    },
}

}

-- Configuracion de windwp/nvim-autopairs, si no funciona el de arriba, descomentar esto y comentar lo de arriba
  --[[ {'windwp/nvim-autopairs',
    enabled = true,
    config = function()
      require("nvim-autopairs").setup()
    end,
  }, ]]
