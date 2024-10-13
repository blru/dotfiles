-- Requires
local keymaps = require("config.keymaps")
require("config.lazy")

-- Options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.laststatus = 3
vim.cmd([[
    :setlocal spell spelllang=en_us 
    :set spell
    :au TermOpen * setlocal nospell
]])

-- Init commands
vim.keymap.set("n", keymaps.general.save_file, "<cmd>:w<CR>")
vim.keymap.set("n", keymaps.general.toggle_wrap, "<cmd>:set wrap!<CR>")
