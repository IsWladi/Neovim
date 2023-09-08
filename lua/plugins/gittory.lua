return{
  -- Para setear el current working directory segun la raiz del proyecto si esta con git.
  {"Wladimir3984/gittory",

    branch = "dev",

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

