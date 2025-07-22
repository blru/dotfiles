local keymaps = require("config.keymaps")

return {
    "rcarriga/nvim-notify",
    lazy = false,
    keys = {
        {
            keymaps.nvim_notify.dismiss_all,
            function()
                require("notify").dismiss()
            end,
            desc = "Dismisses all notifications",
        },
        {
            keymaps.nvim_notify.find_notifications,
            "<cmd>Telescope notify<CR>",
            desc = "List all notifications in Telescope",
        },
    },
    config = function()
        local notify = require("notify")

        notify.setup({
            timeout = 1000,
            render = "minimal",
            level = vim.log.levels.WARN,
            max_width = 36,
            max_height = 3,
            top_down = false,
        })

        vim.notify = notify
    end,
}
