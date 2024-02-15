return{
  -- Para setear el current working directory segun la raiz del proyecto si esta con git.
  {"IsWladi/Gittory",
    branch = "main",
    dependencies = {
        {"rcarriga/nvim-notify"}, -- optional
    },
    config = true,

    opts = {
          notify = "yes",
          atStartUp = "yes"
    },
  }

}

--[[ return{
  -- Para setear el current working directory segun la raiz del proyecto si esta con git.
  {dir = "~/workspace/Gittory/",
    dependencies = {
        {"rcarriga/nvim-notify"}, -- optional
    },
    config = true,

    opts = {
          notify = "yes",
          atStartUp = "yes"
    },
  }

} ]]
