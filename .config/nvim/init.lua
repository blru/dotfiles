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
vim.opt.cursorline = true
vim.opt.background = "dark"

-- Hardcore mode toggle 💀 (very scary)
vim.g.is_hardcore_enabled = false
vim.keymap.set("n", keymaps.general.toggle_hardcore, function()
    vim.g.is_hardcore_enabled = not vim.g.is_hardcore_enabled

    if vim.g.is_hardcore_enabled then
        vim.diagnostic.disable()
    else
        vim.diagnostic.enable()
    end
end, { desc = "Toggles hardcore mode" })

-- Spelling
-- vim.opt.spell = true
-- vim.opt.spelllang = "en_us"
-- vim.cmd([[
--     :au TermOpen * setlocal nospell
-- ]])

-- Init commands
vim.keymap.set("n", keymaps.general.save_file, "<cmd>up<CR>")
vim.keymap.set("n", keymaps.general.toggle_wrap, "<cmd>set wrap!<CR>")
vim.keymap.set("n", keymaps.general.previous_buffer, ":bprev<CR>")
vim.keymap.set("n", keymaps.general.next_buffer, ":bnext<CR>")
