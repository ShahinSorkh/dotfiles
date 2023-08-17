return {
    "folke/lazy.nvim",
    {
        "folke/which-key.nvim",
        config = function(_, opts)
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require("which-key").setup(opts)
        end,
        event = "VeryLazy",
    },
}
