return {
    {
        'ThePrimeagen/harpoon',
        dependencies = { "telescope.nvim" },
        init = function()
            require('telescope').load_extension('harpoon')
            local mark = require('harpoon.mark')
            local ui = require('harpoon.ui')

            vim.keymap.set('n', '<leader>hh', ui.toggle_quick_menu, { desc = "Toggle harpoon marks quick menu" })
            vim.keymap.set('n', '<leader>hs', '<cmd>Telescope harpoon marks<cr>', { desc = "Search harpoon marks" })
            vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = "Add harpoon mark" })
            vim.keymap.set('n', '<leader>h1', function() ui.nav_file(1) end, { desc = "Go to harpoon file 1" })
            vim.keymap.set('n', '<leader>h2', function() ui.nav_file(2) end, { desc = "Go to harpoon file 2" })
            vim.keymap.set('n', '<leader>h3', function() ui.nav_file(3) end, { desc = "Go to harpoon file 3" })
            vim.keymap.set('n', '<leader>h4', function() ui.nav_file(4) end, { desc = "Go to harpoon file 4" })
            vim.keymap.set('n', '<leader>h5', function() ui.nav_file(5) end, { desc = "Go to harpoon file 5" })
            vim.keymap.set('n', '<leader>h6', function() ui.nav_file(6) end, { desc = "Go to harpoon file 6" })
            vim.keymap.set('n', '<leader>h7', function() ui.nav_file(7) end, { desc = "Go to harpoon file 7" })
            vim.keymap.set('n', '<leader>h8', function() ui.nav_file(8) end, { desc = "Go to harpoon file 8" })
            vim.keymap.set('n', '<leader>h9', function() ui.nav_file(9) end, { desc = "Go to harpoon file 9" })
            vim.keymap.set('n', '<leader>h[', ui.nav_prev, { desc = "Go to previous harpoon file" })
            vim.keymap.set('n', '<leader>h]', ui.nav_next, { desc = "Go to next harpoon file" })
        end,
        keys = {
            '<leader>hh',
            '<leader>hs',
            '<leader>ha',
            '<leader>h1',
            '<leader>h2',
            '<leader>h3',
            '<leader>h4',
            '<leader>h5',
            '<leader>h6',
            '<leader>h7',
            '<leader>h8',
            '<leader>h9',
            '<leader>h[',
            '<leader>h]',
        },
    },
}
