local keymaps = require("config.keymaps")

return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            local toggleterm = require("toggleterm")

            toggleterm.setup({
                direction = "horizontal",
                size = 12,
                shade_terminals = false,
                open_mapping = keymaps.terminal.toggle_visible,
            })

            vim.keymap.set(
                "n",
                keymaps.terminal.show_terminals,
                "<cmd>TermSelect<CR>",
                { desc = "Opens the terminal selection menu." }
            )
        end,
    },
}
