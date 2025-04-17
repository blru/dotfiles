-- From https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/utils/colors.lua#L24
local function hex_to_rgb(hex_str)
    local hex = "[abcdef0-9][abcdef0-9]"
    local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
    hex_str = string.lower(hex_str)

    assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

    local red, green, blue = string.match(hex_str, pat)
    return { tonumber(red, 16), tonumber(green, 16), tonumber(blue, 16) }
end

local function blend(fg, bg, alpha)
    bg = hex_to_rgb(bg)
    fg = hex_to_rgb(fg)

    local blendChannel = function(i)
        local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

return {
    "mellow-theme/mellow.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local palette = require("mellow.colors").dark

        local highlight_overrides = {
            ["IblIndent"] = { fg = palette.gray03 },
            ["DiagnosticHint"] = { fg = palette.red },
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
                local bgColor = blend(color, palette.bg, 0.15)

                highlight_overrides["@markup.heading." .. i .. ".markdown"] = { fg = color }
                highlight_overrides["RenderMarkdownH" .. i] = { fg = color }
                highlight_overrides["RenderMarkdownH" .. i .. "Bg"] = { bg = bgColor, bold = true }
            end
        end

        vim.g.mellow_highlight_overrides = highlight_overrides

        vim.cmd(":colorscheme mellow")
    end,
}
