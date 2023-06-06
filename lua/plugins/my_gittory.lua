return{
  {"Wladimir3984/gittory",

    branch = "dev", -- for development

    dependencies = {
        {"nvim-telescope/telescope.nvim"},
        {"rcarriga/nvim-notify"},
    },
    init = function()
      require('gittory').setup()
    end,
  }

}

