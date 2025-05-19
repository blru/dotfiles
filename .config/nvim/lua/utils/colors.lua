local module = {}

-- From https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/utils/colors.lua#L24
function module.hex_to_rgb(hex_str)
    local hex = "[abcdef0-9][abcdef0-9]"
    local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
    hex_str = string.lower(hex_str)

    assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

    local red, green, blue = string.match(hex_str, pat)
    return { tonumber(red, 16), tonumber(green, 16), tonumber(blue, 16) }
end

function module.rgb_to_hex(r, g, b)
    return string.format("#%02X%02X%02X", r, g, b)
end

function module.blend(fg, bg, alpha)
    bg = module.hex_to_rgb(bg)
    fg = module.hex_to_rgb(fg)

    local blendChannel = function(i)
        local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return module.rgb_to_hex(blendChannel(1), blendChannel(2), blendChannel(3))
end

return module
