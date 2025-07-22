local keymaps = require("config.keymaps")

vim.keymap.set(
    "n",
    keymaps.file_specific.markdown.open_preview,
    "<cmd>MarkdownPreview<CR>",
    { buffer = true, noremap = true }
)

-- Enable spelling for markdown
vim.opt_local.spell = true
