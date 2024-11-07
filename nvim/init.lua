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
vim.opt.pumheight = 14

-- Spelling
-- vim.opt.spell = true
-- vim.opt.spelllang = "en_us"
-- vim.cmd([[
--     :au TermOpen * setlocal nospell
-- ]])

-- Init commands
vim.keymap.set("n", keymaps.general.save_file, "<cmd>:w<CR>")
vim.keymap.set("n", keymaps.general.toggle_wrap, "<cmd>:set wrap!<CR>")
