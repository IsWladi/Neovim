--[[ Ejemplo de conexión a una base de datos con vim-dadbod-ui en oracle
DBUI_URL=oracle://user:password@iphost:puerto/xe
DBUI_NAME=database_name ]]

return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
    "tpope/vim-dotenv",
  },
  config = function()
    vim.api.nvim_set_keymap('n', '<leader><leader>d', ":tab DBUI<CR>", {noremap = true, desc = "[database] Open database interface"})
    vim.api.nvim_set_keymap('n', '<leader><leader>dc', ":tabclose<CR>", {noremap = true, desc = "[database] Close database interface"})
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_show_database_icon = 1
    vim.g.db_ui_force_echo_notifications = 1
    vim.g.db_ui_win_position = "right"
    vim.g.db_ui_winwidth = 80
    vim.g.db_ui_icons = {
    expanded = {
      db = "▾ ",
      buffers = "▾ ",
      saved_queries = "▾ ",
      schemas = "▾ ",
      schema = "▾ פּ",
      tables = "▾ 藺",
      table = "▾ ",
    },
    collapsed = {
      db = "▸ ",
      buffers = "▸ ",
      saved_queries = "▸ ",
      schemas = "▸ ",
      schema = "▸ פּ",
      tables = "▸ 藺",
      table = "▸ ",
    },
    saved_query = "",
    new_query = "璘",
    tables = "離",
    buffers = "﬘",
    add_connection = "",
    connection_ok = "✓",
    connection_error = "✕",
  }
  end,
}
