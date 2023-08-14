return{
  {"Wladimir3984/gittory",

    branch = "main", -- for development

    dependencies = {
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

