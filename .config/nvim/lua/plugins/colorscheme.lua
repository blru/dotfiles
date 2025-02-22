return {
    "mellow-theme/mellow.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local palette = require("mellow.colors").dark

        vim.g.mellow_italic_comments = false
        vim.g.mellow_italic_keywords = true
        vim.g.mellow_highlight_overrides = {
            ["IblIndent"] = { fg = palette.gray03 },
        }

        vim.cmd(":colorscheme mellow")
    end,
}
