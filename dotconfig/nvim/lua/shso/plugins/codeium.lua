local imap = function (l, r)
    return { l, r, mode = 'i', expr = true }
end

return {
    {
        'Exafunction/codeium.vim',
        event = {"BufReadPost", "BufNewFile"},
        config = function ()
            vim.g.codeium_disable_bindings = 1
        end,
        keys = {
            imap('<Tab>', vim.fn['codeium#Accept']),
            imap('<M-Space>', vim.fn['codeium#Complete']),
            imap('<M-]>', function() return vim.fn['codeium#CycleCompletions'](1) end),
            imap('<M-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end),
            imap('<C-x>', vim.fn['codeium#Clear']),
        },
    },
}
