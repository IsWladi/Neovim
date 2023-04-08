return{
  {"Wladimir3984/gittory",
    dependencies = {
        {"nvim-telescope/telescope.nvim"},
        {"rcarriga/nvim-notify"},
    },
    keys = {
      { "<CR>f", function() require('gittory').search_git_root() end, desc = '[telescope gittory] find files' },

      { "<CR>fg", function() require('gittory').search_git_root(require('telescope.builtin').live_grep) end,
      desc = '[telescope gittory] live grep' },

      { "<CR>", function() require('gittory').search_git_root(require('telescope.builtin').grep_string,{use_regex = true}) end,
      mode = "x", desc = '[telescope gittory] string grep visual mode with regex' },
    },
  }
}
