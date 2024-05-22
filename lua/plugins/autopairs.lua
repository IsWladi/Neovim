return {
  {
    'altermo/ultimate-autopair.nvim',
    enabled = true,
    event={'InsertEnter','CmdlineEnter'},
    branch='v0.6', --recommended as each new version will have breaking changes
    opts={
      -- fastwarp make some freaky things with the pairs, so I disabled it because I don't use it
      fastwarp={
        enable=false,
        map='<A-f>', --string or table
        rmap='<A-F>', --string or table
        cmap='<A-f>', --string or table
        rcmap='<A-F>', --string or table
      }
    },
  }
}

