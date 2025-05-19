return {
    "dgox16/oldworld.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
        local palette = require("oldworld.palette")

        require("oldworld").setup({
            styles = {
                comments = { italic = true, bold = false },
                highlight_overrides = {
                    ["IblIndent"] = { fg = palette.gray03 },
                    ["CursorLine"] = { bg = palette.gray01 },
                    ["LineNr"] = { fg = palette.gray04 },
                    ["CursorLineNr"] = { fg = palette.gray06 },
                    DiagnosticUnderlineError = { fg = palette.red, underline = true },
                    DiagnosticUnderlineWarn = { fg = palette.yellow, underline = true },
                    DiagnosticUnderlineInfo = { fg = palette.purple, underline = true },
                    DiagnosticUnderlineHint = { fg = palette.cyan, underline = true },
                },
            },
        })

        vim.cmd.colorscheme("oldworld")
    end,
}
