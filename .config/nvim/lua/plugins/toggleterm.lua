local keymaps = require("config.keymaps")

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
        {
            keymaps.terminal.show_terminals,
            "<cmd>TermSelect<CR>",
            desc = "Opens the terminal selection menu.",
        },
        { keymaps.terminal.toggle_visible, desc = "Toggles the terminal's visibility." },
    },
    config = function()
        local toggleterm = require("toggleterm")

        toggleterm.setup({
            direction = "horizontal",
            size = 12,
            shade_terminals = false,
            open_mapping = keymaps.terminal.toggle_visible,
        })
    end,
}
