local M = {}

function M.nnoremap (l, r, desc)
    vim.keymap.set("n", l, r, { desc = desc })
end

function M.inoremap (l, r)
    vim.keymap.set("i", l, r)
end

function M.vnoremap (l, r)
    vim.keymap.set("v", l, r)
end

function M.xnoremap (l, r, desc)
    vim.keymap.set("x", l, r, { desc = desc })
end

function M.nmap (l, r, desc)
    vim.keymap.set("n", l, r, { remap = true, desc = desc })
end

return M
