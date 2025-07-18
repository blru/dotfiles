local keymaps = require("config.keymaps")
local kind_icons = require("config.kind-icons")

return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local mapping = {
            [keymaps.general.popup_menu_secondary_up] = cmp.mapping.scroll_docs(-4),
            [keymaps.general.popup_menu_secondary_down] = cmp.mapping.scroll_docs(4),
            [keymaps.general.popup_menu_up] = cmp.mapping.select_prev_item(),
            [keymaps.general.popup_menu_down] = cmp.mapping.select_next_item(),
            [keymaps.completion.suggest_completions] = cmp.mapping.complete(),
            [keymaps.completion.complete] = cmp.mapping.confirm({ select = true }),
        }

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
            mapping = cmp.mapping.preset.insert(mapping),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "render-markdown" },
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

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline({
                [keymaps.general.popup_menu_up] = { c = cmp.mapping.select_prev_item() },
                [keymaps.general.popup_menu_down] = { c = cmp.mapping.select_next_item() },
            }),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline({
                [keymaps.general.popup_menu_up] = { c = cmp.mapping.select_prev_item() },
                [keymaps.general.popup_menu_down] = { c = cmp.mapping.select_next_item() },
            }),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })
    end,
}
