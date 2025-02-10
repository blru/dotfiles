local keymaps = require("config.keymaps")

return {
    "szw/vim-maximizer",
    keys = {
        { keymaps.maximizer.toggle, "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
    },
}
