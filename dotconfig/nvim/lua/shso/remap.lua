vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Explore, { desc = "open netrw here" })
vim.keymap.set("n", "<leader>E", function() vim.cmd.Explore(vim.fn.getcwd()) end, { desc = "open netrw at root" })
-- vim.keymap.set("n", "<C-Slash>", vim.cmd.terminal, { desc = "open terminal" })

vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("v", "K", ":m '>-2<cr>gv=gv'")
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv'")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zzzv")
vim.keymap.set("n", "#", "#zzzv")

vim.keymap.set("n", "<C-k><C-0>", ":set foldlevel=0<CR>")
vim.keymap.set("n", "<C-k><C-1>", ":set foldlevel=1<CR>")
vim.keymap.set("n", "<C-k><C-2>", ":set foldlevel=2<CR>")
vim.keymap.set("n", "<C-k><C-3>", ":set foldlevel=3<CR>")
vim.keymap.set("n", "<C-k><C-4>", ":set foldlevel=4<CR>")
vim.keymap.set("n", "<C-k><C-5>", ":set foldlevel=5<CR>")
vim.keymap.set("n", "<C-k><C-6>", ":set foldlevel=6<CR>")
vim.keymap.set("n", "<C-k><C-7>", ":set foldlevel=7<CR>")
vim.keymap.set("n", "<C-k><C-8>", ":set foldlevel=8<CR>")
vim.keymap.set("n", "<C-k><C-9>", ":set foldlevel=9<CR>")

vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "paste without messing with default register" })

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-j>", "<cmd>cnext<cr>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<cr>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<cr>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<cr>zz")


vim.keymap.set("n", "[o", "O<esc>")
vim.keymap.set("n", "]o", "o<esc>")

-- vim.keymap.set("x", ">", "g>")
-- vim.keymap.set("x", "<", "g<")

