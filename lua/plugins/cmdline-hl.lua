return {
    {
        'Sam-programs/cmdline-hl.nvim',
        enabled = true,
        event = 'VimEnter',
        opts = {
            type_signs = {
                [":"] = { ":", "Title" },
                ["/"] = { "/", "Title" },
                ["?"] = { "?", "Title" },
            },
        }
    }
}
