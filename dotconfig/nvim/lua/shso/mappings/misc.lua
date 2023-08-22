local nnoremap = require('shso.mappings._map').nnoremap
local inoremap = require('shso.mappings._map').inoremap
local xnoremap = require('shso.mappings._map').xnoremap
local vnoremap = require('shso.mappings._map').vnoremap

nnoremap("<leader>e", vim.cmd.Explore, "open netrw here")
nnoremap("<leader>E", function() vim.cmd.Explore(vim.fn.getcwd()) end, "open netrw at root")

nnoremap("<cr>", "<cmd>noh<cr><cr>")
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

xnoremap("<leader>p", "\"_dP", "paste without messing with default register")

nnoremap("Q", "<nop>", "<nop>")

nnoremap("[o", "O<esc>", "Add new line above")
nnoremap("]o", "o<esc>", "Add new line below")
