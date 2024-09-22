return{
  {"IsWladi/Gittory",

    branch = "main",
    tag = "v0.2.0",

    dependencies = {
        {"j-hui/fidget.nvim"},
    },
    opts = {
          atStartUp = true,

          notifySettings = {
            enabled = true,
            availableNotifyPlugins =  {"fidget"}
          }


          -- -- NOT IMPLEMENTED YET, ARE POSSIBLE FUTURE FEATURES
          -- excludeProjects = {
          --   "~/workspace/super-big-project/",
          --   "**/super-big-project/"
          -- },
          --
          -- subRoots = {
          --   autoDetect = false, -- if true it will detect the subroots at startup (not recommended)
          --   roots = {
          --     node = {
          --       commandName = "node",
          --       patterns = {
          --         "node_modules",
          --         "package*.json",
          --       }
          --     },
          --     python = {
          --       commandName = "python",
          --       patterns = {
          --         "venv",
          --         "requirements*.txt",
          --       }
          --     },
          --   }
          -- }
    },
  }
}
