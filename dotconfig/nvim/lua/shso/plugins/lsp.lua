return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        event = {"BufReadPost", "BufNewFile"},
        dependencies = {
            -- LSP Support
            {'folke/neodev.nvim', opts = {}},
            { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
            {'neovim/nvim-lspconfig'},
            {
                'williamboman/mason.nvim',
                cmd = "Mason",
                build = ":MasonUpdate",
                ---@type MasonSettings | {ensure_installed: string[]}
                opts = {
                  ensure_installed = {
                    "stylua",
                    "shfmt",
                    "prettier",
                  },
                  pip = { upgrade_pip = true },
                },
                ---@param opts MasonSettings | {ensure_installed: string[]}
                config = function(_, opts)
                    require("mason").setup(opts)
                    local mr = require("mason-registry")
                    local function ensure_installed()
                        for _, tool in ipairs(opts.ensure_installed) do
                            local p = mr.get_package(tool)
                            if not p:is_installed() then
                                p:install()
                            end
                        end
                    end
                    if mr.refresh then
                        mr.refresh(ensure_installed)
                    else
                        ensure_installed()
                    end
                end,
            },
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {
                "hrsh7th/nvim-cmp",
                version = false, -- last release is way too old
                event = "InsertEnter",
                dependencies = {
                    "hrsh7th/cmp-nvim-lsp",
                    "hrsh7th/cmp-buffer",
                    "hrsh7th/cmp-path",
                    "hrsh7th/cmp-nvim-lua",
                    "saadparwaiz1/cmp_luasnip",
                },
                opts = function()
                    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
                    local cmp = require("cmp")
                    local defaults = require("cmp.config.default")()
                    return {
                        completion = {
                            completeopt = "menu,menuone,noinsert",
                        },
                        snippet = {
                            expand = function(args)
                                require("luasnip").lsp_expand(args.body)
                            end,
                        },
                        mapping = cmp.mapping.preset.insert({
                            ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                            ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                            ["<C-f>"] = cmp.mapping.scroll_docs(4),
                            ["<C-Space>"] = cmp.mapping.complete(),
                            ["<C-e>"] = cmp.mapping.abort(),
                            ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                            ["<S-CR>"] = cmp.mapping.confirm({
                                behavior = cmp.ConfirmBehavior.Replace,
                                select = true,
                            }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                        }),
                        sources = cmp.config.sources({
                            { name = "nvim_lsp" },
                            { name = "luasnip" },
                            { name = "buffer" },
                            { name = "path" },
                        }),
                        formatting = {
                            format = function(_, item)
                                local icons = require("shso.icons").kinds
                                if icons[item.kind] then
                                    item.kind = icons[item.kind] .. item.kind
                                end
                                return item
                            end,
                        },
                        experimental = {
                            ghost_text = {
                                hl_group = "CmpGhostText",
                            },
                        },
                        sorting = defaults.sorting,
                    }
                end,
            },

            -- Snippets
            {
                "L3MON4D3/LuaSnip",
                build = (not jit.os:find("Windows"))
                    and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
                    or nil,
                dependencies = {
                    {
                        "rafamadriz/friendly-snippets",
                        config = function()
                            require("luasnip.loaders.from_vscode").lazy_load()
                        end,
                    }
                },
                opts = {
                    history = true,
                    delete_check_events = "TextChanged",
                },
                -- stylua: ignore
                keys = {
                    {
                        "<tab>",
                        function()
                            return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
                        end,
                        expr = true, silent = true, mode = "i",
                    },
                    { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
                    { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
                },
            },
        },
        config = function()
            local lsp = require('lsp-zero').preset({})

            require('neodev').setup({})
            require('neoconf').setup({})
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            -- lsp.set_preferences({
            --     sign_icons = {}
            -- })
            lsp.on_attach(function(_, bufnr)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = "Go to references" })
                vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Go to type definition" })
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
                -- vim.keymap.set('n', '<leader>cls', vim.lsp.buf.workspace_symbol, { buffer = bufnr, desc = "Workspace symbols" })
                vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { buffer = bufnr, desc = "Show diagnostics" })
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Go to previous diagnostic" })
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = bufnr, desc = "Go to next diagnostic" })
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
                vim.keymap.set('n', '<leader>crr', vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
                vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature help" })
            end)
            lsp.setup()
        end,
    },
}
