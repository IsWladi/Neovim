-- return{
--   {'IsWladi/Gittory',
--     dependencies = {
--       "j-hui/fidget.nvim", -- notification plugin
--       "nvim-lua/plenary.nvim", -- to use the test suite
--     },
--     branch = "dev",
--     -- tag = "v0.1.0",
--     opts = {
--           atStartUp = true,
--           notifySettings = {
--             enabled = true,
--             availableNotifyPlugins =  {"fidget"},
--           }
--     },
--   }
--
-- }

-- Uncomment this to be in development mode
--
return{
  {dir = "~/workspace/Gittory/", -- for development purposes use local path instead of github
    dependencies = {
      "nvim-lua/plenary.nvim", -- to use the test suite
    },
    enabled = true,
    -- config = true,
    opts = {
          atStartUp = true,
          -- notifySettings = "",
          notifySettings = {
            enabled = true,
            -- availableNotifyPlugins = "" -- you can change the order of the plugins
            -- availableNotifyPlugins = {} -- you can change the order of the plugins
            -- availableNotifyPlugins = {""} -- you can change the order of the plugins
            -- availableNotifyPlugins =  {"print"} -- you can change the order of the plugins
            -- availableNotifyPlugins =  {"notify"} -- you can change the order of the plugins
            -- availableNotifyPlugins =  {"fidget"} -- you can change the order of the plugins
            -- availableNotifyPlugins =  {"notify", "fidget"} -- you can change the order of the plugins
            availableNotifyPlugins =  {"fidget", "notify"}, -- you can change the order of the plugins
            -- availableNotifyPlugins =  "fidgest",

            messagesConfig = {
              title = "Gittory",
              commandsMessages = {
                commonErrors = {
                  notActivatedYet = "The plugin has not been activated yet.",
                },
              },
            },
          },

          -- not implemented yet, it is a posible future feature
          excludeProjects = {
            "~/workspace/super-big-project/",
            "**/super-big-project/"
          },

          -- not implemented yet, it is a posible future feature
          subRoots = {
            autoDetect = false, -- if true it will detect the subroots at startup (not recommended)
            roots = {
              node = {
                commandName = "node",
                patterns = {
                  "node_modules",
                  "package*.json",
                }
              },
              python = {
                commandName = "python",
                patterns = {
                  "venv",
                  "requirements*.txt",
                }
              },
            }
          }
          },
    },
  }

