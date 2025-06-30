local keymaps = require("config.keymaps")

return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = { "rafamadriz/friendly-snippets" },
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
        local luasnip = require("luasnip")

        luasnip.setup({})
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_snipmate").lazy_load()
    end,
}
