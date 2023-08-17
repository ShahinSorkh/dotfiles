local nnoremap = function (l, r, desc)
    vim.keymap.set("n", l, r, { desc = desc })
end
local inoremap = function (l, r)
    vim.keymap.set("i", l, r)
end
local vnoremap = function (l, r)
    vim.keymap.set("v", l, r)
end
local xnoremap = function (l, r, desc)
    vim.keymap.set("x", l, r, { desc = desc })
end

vim.g.mapleader = " "

nnoremap("<leader>e", vim.cmd.Explore, "open netrw here")
nnoremap("<leader>E", function() vim.cmd.Explore(vim.fn.getcwd()) end, "open netrw at root")

inoremap("jk", "<esc>")

xnoremap(">", ">gv")
xnoremap("<", "<gv")

vnoremap("<M-k>", ":m '<-2<cr>gv=gv")
vnoremap("<M-j>", ":m '>+1<cr>gv=gv")
nnoremap("j", "gj")
nnoremap("k", "gk")

nnoremap("<C-b>", "<C-b>zz")
nnoremap("<C-f>", "<C-f>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("*", "*zzzv")
nnoremap("#", "#zzzv")

nnoremap("z1", ":set foldlevel=1<CR>", "Set foldlevel to 1")
nnoremap("z2", ":set foldlevel=2<CR>", "Set foldlevel to 2")
nnoremap("z3", ":set foldlevel=3<CR>", "Set foldlevel to 3")
nnoremap("z4", ":set foldlevel=4<CR>", "Set foldlevel to 4")
nnoremap("z5", ":set foldlevel=5<CR>", "Set foldlevel to 5")
nnoremap("z6", ":set foldlevel=6<CR>", "Set foldlevel to 6")
nnoremap("z7", ":set foldlevel=7<CR>", "Set foldlevel to 7")
nnoremap("z8", ":set foldlevel=8<CR>", "Set foldlevel to 8")
nnoremap("z9", ":set foldlevel=9<CR>", "Set foldlevel to 9")

xnoremap("<leader>p", "\"_dP", "paste without messing with default register")

nnoremap("Q", "<nop>", "")

-- nnoremap("<C-j>", "<cmd>cnext<cr>zz", "Next item in quick list")
-- nnoremap("<C-k>", "<cmd>cprev<cr>zz", "Previous item in quick list")
-- nnoremap("<leader>j", "<cmd>lnext<cr>zz", "Next item in loclist")
-- nnoremap("<leader>k", "<cmd>lprev<cr>zz", "Previous item in loclist")

nnoremap("[o", "O<esc>", "Add new line above")
nnoremap("]o", "o<esc>", "Add new line below")

