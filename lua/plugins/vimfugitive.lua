return {
  {"tpope/vim-fugitive",
  lazy = false,
  config = function()
    vim.keymap.set("n", "<leader>gg" , ":Git<cr>" )
    vim.keymap.set("n", "<leader>gf", ":Git fetch<cr>")
    vim.keymap.set("n", "<leader>gl", ":Git pull<cr>")
    vim.keymap.set("n", "<leader>gp", ":Git push<cr>")
  end,
  },
}
