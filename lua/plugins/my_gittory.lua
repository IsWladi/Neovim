return{
  {"Wladimir3984/gittory",

    branch = "main", -- for development

    dependencies = {
        {"rcarriga/nvim-notify"},
    },
    lazy = false,
    priority = 900,
    init = function()
      local gittory = require('gittory')
      gittory.setup{
          notify = "yes",
          atStartUp = "yes"
        }
    end,
  }

}

