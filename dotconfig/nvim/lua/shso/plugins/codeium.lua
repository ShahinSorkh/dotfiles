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
            imap('<C-y>', function () return vim.fn['codeium#Accept']() end),
            imap('<M-Space>', function() return vim.fn['codeium#CycleCompletions'](1) end),
            imap('<M-]>', function() return vim.fn['codeium#CycleCompletions'](1) end),
            imap('<M-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end),
            imap('<C-x>', function() return vim.fn['codeium#Clear']() end),
        },
    },
}
