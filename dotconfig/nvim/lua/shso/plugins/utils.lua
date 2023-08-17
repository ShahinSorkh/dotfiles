return {
    {
        'tpope/vim-fugitive',
        cmd = {"Git"},
        keys = {
            {"<leader>gg", vim.cmd.Git, desc = "Git"},
        },
    },
    {
        'tpope/vim-commentary',
        keys = {"gcc", "gc", "gcu", {"gc", mode = "x"}},
    },
    {
        'tpope/vim-surround',
        keys = {"ds", "cs", "cS", 'ys', 'yS', 'yss', 'ySs', 'ySS',
                { 'S', mode = "x" },
                { 'gS', mode = "x" },
                { '<C-S>', mode = "i" },
                { '<C-G>s', mode = "i" },
                { '<C-G>S', mode = "i" },
        },
    },
    { 'tpope/vim-repeat', event = { "BufReadPost", "BufNewFile" } },
    {
        'mbbill/undotree',
        event = { "BufReadPost", "BufNewFile" },
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree" }},
        },
    },
}
