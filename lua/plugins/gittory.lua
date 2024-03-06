return{
  {dir = "~/workspace/Gittory/", -- for development purposes use local path instead of github
    opts = {
          atStartUp = true,
          notifySettings = {
            enabled = true,
            -- availableNotifyPlugins = "" -- you can change the order of the plugins
            -- availableNotifyPlugins = {} -- you can change the order of the plugins
            -- availableNotifyPlugins = {""} -- you can change the order of the plugins
            -- availableNotifyPlugins =  {"print"} -- you can change the order of the plugins
            -- availableNotifyPlugins =  {"notify"} -- you can change the order of the plugins
            -- availableNotifyPlugins =  {"fidget"} -- you can change the order of the plugins
            -- availableNotifyPlugins =  {"notify", "fidget"} -- you can change the order of the plugins
            -- availableNotifyPlugins =  {"fidget", "notify"} -- you can change the order of the plugins
            availableNotifyPlugins =  {"fidget", "notify", "print"} -- you can change the order of the plugins
          }
    },
  }

}
