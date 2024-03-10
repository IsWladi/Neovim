return{
  {'IsWladi/Gittory',
    dependencies = {
      "j-hui/fidget.nvim", -- notification plugin
      "nvim-lua/plenary.nvim", -- to use the test suite
    },
    branch = "main",
    tag = "v0.1.0",
    opts = {
          atStartUp = true,
          notifySettings = {
            enabled = true,
            availableNotifyPlugins =  {"fidget"},
          }
    },
  }

}

-- Uncomment this to be in development mode
-- return{
--   {dir = "~/workspace/Gittory/", -- for development purposes use local path instead of github
--     dependencies = {
--       "nvim-lua/plenary.nvim", -- to use the test suite
--     },
--     opts = {
--           atStartUp = true,
--           -- notifySettings = ""
--           notifySettings = {
--             -- enabled = false,
--             -- availableNotifyPlugins = "" -- you can change the order of the plugins
--             -- availableNotifyPlugins = {} -- you can change the order of the plugins
--             -- availableNotifyPlugins = {""} -- you can change the order of the plugins
--             -- availableNotifyPlugins =  {"print"} -- you can change the order of the plugins
--             -- availableNotifyPlugins =  {"notify"} -- you can change the order of the plugins
--             -- availableNotifyPlugins =  {"fidget"} -- you can change the order of the plugins
--             -- availableNotifyPlugins =  {"notify", "fidget"} -- you can change the order of the plugins
--             -- availableNotifyPlugins =  {"fidget", "notify"} -- you can change the order of the plugins
--             availableNotifyPlugins =  {"fidget", "notify", "print"} -- you can change the order of the plugins
--           }
--     },
--   }
--
-- }
