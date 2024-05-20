return {
  {
    -- Deactivated because of incompatibility my config of luasnip and cmp :c
    'altermo/ultimate-autopair.nvim',
    enabled=false,
    event={'InsertEnter','CmdlineEnter'},
    branch='v0.6', --recommended as each new version will have breaking changes
    opts={
      --Config goes here
    },
  },
  {
    'windwp/nvim-autopairs',
    enabled = true,
    event = "InsertEnter",
    opts = {
    } -- this is equalent to setup({}) function
  }

}

