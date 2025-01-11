local keymaps = require("config.keymaps")

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local nvimtree = require("nvim-tree")

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            view = {
                width = 30,
            },
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            git = {
                ignore = false,
            },
            renderer = {
                icons = {
                    glyphs = {
                        git = {
                            unstaged = "U",
                            staged = "S",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
            },
        })

        -- Keymaps
        vim.keymap.set("n", keymaps.nvim_tree.toggle, "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- Toggle file explorer
        vim.keymap.set(
            "n",
            keymaps.nvim_tree.toggle_current_file,
            "<cmd>NvimTreeFindFileToggle<CR>",
            { desc = "Toggle file explorer on current file" }
        ) -- Toggle file explorer on current file
    end,
}
