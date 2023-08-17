return {
    {
        'nvim-telescope/telescope.nvim',
        version = false,
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
        },
        opts = {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
            }
        },
        init = function()
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Find files' })
            vim.keymap.set('n', '<leader><leader>', builtin.git_files, { desc = 'Git files' })
            vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Grep' })
            vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = 'Buffers' })
            vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })
            vim.keymap.set('n', '<leader>s/', builtin.search_history, { desc = 'Search history' })
            vim.keymap.set('n', '<M-x>', builtin.commands, { desc = 'Commands' })
        end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        dependencies = {
            { 'nvim-telescope/telescope.nvim' },
        },
        init = function()
            require('telescope').load_extension('fzf')
        end,
        build = 'make',
        event = 'VeryLazy',
    },
}
