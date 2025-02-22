return {
    "mellow-theme/mellow.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local palette = require("mellow.colors").dark

        vim.g.mellow_highlight_overrides = {
            ["IblIndent"] = { fg = palette.gray03 },
            ["DiagnosticHint"] = { fg = palette.red },
            ["DiagnosticError"] = { fg = palette.cyan },
        }

        vim.cmd(":colorscheme mellow")
    end,
}
