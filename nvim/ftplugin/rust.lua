local keymaps = require("config.keymaps")
local toggleterm = require("toggleterm")
local map = vim.keymap.set

map("n", keymaps.file_specific["*"].open_documentation_website, function()
    vim.cmd.RustLsp("openDocs")
end)
