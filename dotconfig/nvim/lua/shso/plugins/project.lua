return {
    {
        "ahmedkhalf/project.nvim",
        keys = {
            { "<leader>pp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
        },
        opts = {},
        event = "VeryLazy",
        config = function(_, opts)
            require('project_nvim').setup(opts)
            require("telescope").load_extension("projects")
        end,
    },
}
