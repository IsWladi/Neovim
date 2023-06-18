return{
  {"Wladimir3984/gittory",

    branch = "dev", -- for development

    dependencies = {
        {"nvim-telescope/telescope.nvim"},
        {"rcarriga/nvim-notify"},
    },
    init = function()
      local gittory = require('gittory')
      gittory.setup{
          notify = "yes",
          atStartUp = "yes"
        }
    end,
  }

}

