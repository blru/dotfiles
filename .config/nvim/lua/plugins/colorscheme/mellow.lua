local colors = require("utils.colors")

return {
    "mellow-theme/mellow.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
        local palette = require("mellow.colors").dark

        local highlight_overrides = {
            ["IblIndent"] = { fg = palette.gray03 },
            ["DiagnosticHint"] = { fg = palette.blue },
            ["DiagnosticError"] = { fg = palette.cyan },
            ["DiagnosticUnderlineHint"] = { fg = palette.red, underline = true },
            ["DiagnosticUnderlineError"] = { fg = palette.cyan, underline = true },
        }

        -- Markdown colors
        do
            local heading_colors =
                { palette.cyan, palette.magenta, palette.red, palette.yellow, palette.blue, palette.green }

            for i = 1, 6 do
                local color = heading_colors[i]
                local bgColor = colors.blend(color, palette.bg, 0.15)

                highlight_overrides["@markup.heading." .. i .. ".markdown"] = { fg = color }
                highlight_overrides["RenderMarkdownH" .. i] = { fg = color }
                highlight_overrides["RenderMarkdownH" .. i .. "Bg"] = { bg = bgColor, bold = true }
            end
        end

        vim.g.mellow_highlight_overrides = highlight_overrides

        vim.cmd.colorscheme("mellow")
    end,
}
