local keymaps = require("config.keymaps")

return {
    "uga-rosa/ccc.nvim",
    cmd = { "CccPick" },
    keys = {
        {
            keymaps.ccc.open_picker,
            "<cmd>CccPick<CR>",
            desc = "Opens the color picker",
        },
    },
    config = function()
        local ccc = require("ccc")

        ccc.setup({})
    end,
}
