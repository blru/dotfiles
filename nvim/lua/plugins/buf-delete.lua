local keymaps = require("config.keymaps")

return {
    "famiu/bufdelete.nvim",
    keys = {
        {
            keymaps.general.delete_buffer,
            function()
                -- Modified version of https://github.com/LazyVim/LazyVim/blob/7f9219162b54a717b7da5cb543ab1e778c9a124b/lua/lazyvim/plugins/editor.lua#L423C11-L434C14
                local delete_buf = require("bufdelete").bufdelete

                if vim.bo.modified then
                    local choice =
                        vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")

                    if choice == 1 then -- Yes
                        vim.cmd.write()
                    end

                    -- Forcibly delete buffer without saving if choice is no
                    delete_buf(0, choice == 2)
                else
                    delete_buf(0, false)
                end
            end,
            desc = "Delete the current buffer",
        },
    },
}
