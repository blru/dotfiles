local keymaps = require("config.keymaps")

return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {
            keymaps.telescope.find_files,
            "<cmd>Telescope find_files<cr>",
            desc = "Fuzzy find files in current working directory.",
        },
        {
            keymaps.telescope.find_recent,
            "<cmd>Telescope oldfiles<cr>",
            desc = "Fuzzy find recently opened files.",
        },
        {
            keymaps.telescope.find_string,
            "<cmd>Telescope live_grep<cr>",
            desc = "Find string in current working directory.",
        },
        {
            keymaps.telescope.find_buffers,
            "<cmd>Telescope buffers sort_lastused=True<cr>",
            desc = "Find currently opened buffers.",
        },
        {
            keymaps.lsp.show_references,
            "<cmd>Telescope lsp_references<CR>",
            desc = "Show LSP references",
        },
        {
            keymaps.lsp.show_definitions,
            "<cmd>Telescope lsp_definitions<CR>",
            desc = "Show LSP definitions",
        },
        {
            keymaps.lsp.show_implementations,
            "<cmd>Telescope lsp_implementations<CR>",
            desc = "Show LSP implementations",
        },
        {
            keymaps.lsp.show_type_definitions,
            "<cmd>Telescope lsp_type_definitions<CR>",
            desc = "Show LSP type definitions",
        },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        [keymaps.general.popup_menu_up] = actions.move_selection_previous,
                        [keymaps.general.popup_menu_down] = actions.move_selection_next,
                    },
                },
                file_ignore_patterns = {},
            },
        })

        telescope.load_extension("fzf")
    end,
}
