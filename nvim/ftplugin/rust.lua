local keymaps = require("config.keymaps")
local toggleterm = require("toggleterm")
local map = vim.keymap.set

map("n", keymaps.file_specific["*"].run_single_file, function()
    toggleterm.exec(string.format("rustc -o /tmp/skibidi-out %s && /tmp/skibidi-out", vim.fn.expand("%")))
end)

map("n", keymaps.file_specific["*"].open_documentation_website, function()
    vim.cmd.RustLsp("openDocs")
end)
