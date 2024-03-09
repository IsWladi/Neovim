--
-- -    --prettier html css js markdown
-- -    elseif ft == 'yaml' or ft == 'html' or ft == 'css' or ft == 'scss' or ft == 'javascript' or ft == 'markdown' or ft == 'typescript' or ft == 'json' then
-- -        vim.cmd('!npx prettier --write %')
-- -    else
--
return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = {"autopep8"},
      markdown = {"prettier"},
      javascript = {"prettier"},
      html = {"prettier"},
      css = {"prettier"},
      typescript = {"prettier"},
      json = {"prettier"},
      yml = {"prettier"},
    },
  },
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>F', ':lua require("conform").format()<CR>', { noremap = true, silent = false })
  end,
}
