local keymaps = require("config.keymaps")
local toggleterm = require("toggleterm")
local map = vim.keymap.set

local clang_arguments = "-Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -pedantic-errors -std=c++20"

map("n", keymaps.file_specific["*"].run_single_file, function()
    toggleterm.exec(
        string.format(
            "clang++ %s -ggdb -o /tmp/skibidi-out %s && /tmp/skibidi-out",
            clang_arguments,
            vim.fn.expand("%")
        )
    )
end)

map("n", keymaps.file_specific["*"].run_single_file_release, function()
    toggleterm.exec(
        string.format(
            "clang++ %s -O2 -DNDEBUG -o /tmp/skibidi-out %s && /tmp/skibidi-out",
            clang_arguments,
            vim.fn.expand("%")
        )
    )
end)
