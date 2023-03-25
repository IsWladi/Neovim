return{
{'glts/vim-radical',
  dependencies = {
    {'glts/vim-magnum'},
    {'tpope/vim-repeat'}
  }
}
}

--doc
--The entire functionality of this plugin can be summarised in two items.
--
--gA shows the four representations of the number under the cursor (or selected in Visual mode).
--crd, crx, cro, crb convert the number under the cursor to decimal, hex, octal, binary, respectively.
