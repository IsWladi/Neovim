return {
  {"tpope/vim-fugitive",
  lazy = false,
  config = function()
  vim.keymap.set("n", "<leader>gg" , ":Git<cr>", {desc        = '[git] Open Git'})
  vim.keymap.set("n", "<leader>gf", ":Git fetch --all -p<cr>", {desc   = '[git] Fetch all and prune from Git'})
  vim.keymap.set("n", "<leader>gl", ":Git pull<cr>", {desc    = '[git] Pull from Git'})
  vim.keymap.set("n", "<leader>gp", ":Git push<cr>", {desc    = '[git] Push to Git'})
  vim.keymap.set("n", "<leader>gs" , ":Git status<cr>", {desc = '[git] Open Git status'})
  vim.keymap.set("n", "<leader>gb", ":Git blame<cr>", {desc   = '[git] Open Git blame'})
  vim.keymap.set("n", "<leader>gd", ":Git diff<cr>", {desc    = '[git] View Git diff'})
  vim.keymap.set("n", "<leader>gr", ":Git reflog<cr>", {desc  = '[git] Open Git reflog'})
  end,
  },
}
