return {
    "williamboman/mason.nvim",
    dependencies = {},
    config = function()
        local mason = require("mason")

        mason.setup({})
    end,
}
