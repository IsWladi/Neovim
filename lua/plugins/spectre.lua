return {
  "nvim-pack/nvim-spectre",
  keys = { { "<leader>F", ":Spectre<cr>", desc = "Spectre Search open" } },
  config = true,
  dependencies = {
    {"nvim-lua/plenary.nvim"},
    {"nvim-tree/nvim-web-devicons"}
  },
}
