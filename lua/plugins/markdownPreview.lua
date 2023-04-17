return{
  {"iamcco/markdown-preview.nvim",
    config = function ()
      vim.g.mkdp_browser = "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"
    end
  }
  -- after it is installed, run :call mkdp#util#install() to install the app
}
