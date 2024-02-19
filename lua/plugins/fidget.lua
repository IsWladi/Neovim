return {
  "j-hui/fidget.nvim",
  config = true,
  opts = {
    -- Options related to notification subsystem
    notification = {
      override_vim_notify = true,  -- Automatically override vim.notify() with Fidget

      window = {
        winblend = 50,             -- Background color opacity in the notification window
      },
    },
  },
}
