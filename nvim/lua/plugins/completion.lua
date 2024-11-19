local keymaps = require("config.keymaps")

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
    config = function()
        local cmp = require("cmp")

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
            [keymaps.completion.confirm_completion_or_snippet_forward] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.confirm({ select = true })
                elseif vim.snippet.active({ direction = 1 }) then
                    vim.schedule(function()
                        vim.snippet.jump(1)
                    end)
                else
                    fallback()
                end
            end, { "i", "s" }),
            [keymaps.completion.snippet_backward] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.confirm({ select = true })
                elseif vim.snippet.active({ direction = -1 }) then
                    vim.schedule(function()
                        vim.snippet.jump(-1)
                    end)
                else
                    fallback()
                end
            end, { "i", "s" }),
        })

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            enabled = function()
                return not vim.g.is_hardcore_enabled
            end,
            -- snippet = {},
            mapping = mapping,
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
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
}
