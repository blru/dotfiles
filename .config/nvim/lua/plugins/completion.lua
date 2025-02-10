local keymaps = require("config.keymaps")

return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
            },
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            local kind_icons = {
                Text = "",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰇽",
                Variable = "󰂡",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "󰅲",
            }

            local mapping = cmp.mapping.preset.insert({
                [keymaps.general.popup_menu_secondary_up] = cmp.mapping.scroll_docs(-4),
                [keymaps.general.popup_menu_secondary_down] = cmp.mapping.scroll_docs(4),
                [keymaps.general.popup_menu_up] = cmp.mapping.select_prev_item(),
                [keymaps.general.popup_menu_down] = cmp.mapping.select_next_item(),
                [keymaps.completion.suggest_completions] = cmp.mapping.complete(),
                [keymaps.completion.complete] = cmp.mapping.confirm({ select = true }),
            })

            cmp.setup({
                completion = {
                    completeopt = "menu,menuone,preview,noselect",
                },
                enabled = function()
                    return not vim.g.is_hardcore_enabled
                end,
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = mapping,
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
                formatting = {
                    format = function(entry, vim_item)
                        vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
                        return vim_item
                    end,
                },
            })
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        lazy = false,
        keys = {
            {
                keymaps.completion.snippet_forward,
                function()
                    require("luasnip").jump(1)
                end,
                desc = "Jump forward a snippet placement",
                mode = "i",
                noremap = true,
                silent = true,
            },
            {
                keymaps.completion.snippet_backward,
                function()
                    require("luasnip").jump(-1)
                end,
                desc = "Jump backward a snippet placement",
                mode = "i",
                noremap = true,
                silent = true,
            },
        },
        config = function()
            require("luasnip.loaders.from_lua").load({ paths = "~/.snippets" })
        end,
    },
}
