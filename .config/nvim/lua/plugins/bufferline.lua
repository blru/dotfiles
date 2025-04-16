return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local bufferline = require("bufferline")

        bufferline.setup({
            options = {
                style_preset = bufferline.style_preset.normal,
                diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Winbar",
                        separator = true,
                    },
                },
            },
        })
    end,
}
