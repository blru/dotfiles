local keymaps = require("config.keymaps")

return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    keys = {
        {
            keymaps.telescope.find_todos,
            "<cmd>:TodoTelescope<cr>",
            desc = "Finds TODO and such comments within the current working directory.",
        },
    },
    opts = {},
}
