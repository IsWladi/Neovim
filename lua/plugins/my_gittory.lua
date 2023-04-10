return{
  {"Wladimir3984/gittory",

    dependencies = {

        {"nvim-telescope/telescope.nvim"},
        {"rcarriga/nvim-notify"},
    },
    keys = {

      { "<CR>f", function()
                        require('gittory').search_git_root() -- For default use find_files
                      end,
      desc = '[telescope gittory] find files' },

      { "<CR>g", function()
                        local liveGrep = require('telescope.builtin').live_grep
                        require('gittory').search_git_root(liveGrep)
                      end,
      desc = '[telescope gittory] live grep' },

      { "<CR>", function()
                  local grepString = require('telescope.builtin').grep_string
                  local args = {use_regex = true}
                  require('gittory').search_git_root(grepString, args)
                end,
      mode = "x", desc = '[telescope gittory] string grep visual mode with regex' },

      { "<CR>h", function() require('gittory').telescope_home() end, --testing, too much bugs
       desc = '[telescope gittory] find from home with telescope' },
    },

  }

}

