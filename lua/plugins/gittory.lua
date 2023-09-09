return{
  -- Para setear el current working directory segun la raiz del proyecto si esta con git.
  {"IsWladi/Gittory",

    branch = "main",

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

