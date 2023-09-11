return {
  -- Probando neogit, ver si me gusta mas que fugitive.
{
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",        -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = true,
  lazy = true,
  keys = {
      {"<leader>gg", ":Neogit<CR>"}
    },
}
}
