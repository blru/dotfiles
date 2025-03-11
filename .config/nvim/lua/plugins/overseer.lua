local keymaps = require("config.keymaps")

return {
    "stevearc/overseer.nvim",
    lazy = true,
    keys = {
        {
            keymaps.overseer.run,
            "<cmd>OverseerRun<cr>",
            desc = "Opens overseer run menu",
        },
        {
            keymaps.overseer.toggle,
            "<cmd>OverseerToggle<cr>",
            desc = "Toggles the overseer job viewer",
        },
        {
            keymaps.overseer.restart_last_task,
            "<cmd>OverseerRestartLast<cr>",
            desc = "Reruns the last run task",
        },
    },
    opts = {},
    config = function()
        local overseer = require("overseer")

        overseer.setup({
            strategy = {
                "toggleterm",
                size = 12,
                auto_scroll = true,
                on_create = function(term)
                    vim.cmd("startinsert!")
                    vim.api.nvim_buf_set_keymap(
                        term.bufnr,
                        "n",
                        "q",
                        "<cmd>close<CR>",
                        { noremap = true, silent = true }
                    )
                end,
            },
            templates = { "builtin", "user.cpp-build-and-run", "user.cpp-build", "user.cpp-run" },
        })

        vim.api.nvim_create_user_command("OverseerRestartLast", function()
            local tasks = overseer.list_tasks({ recent_first = true })
            if vim.tbl_isempty(tasks) then
                vim.notify("No tasks found", vim.log.levels.WARN)
            else
                overseer.run_action(tasks[1], "restart")
            end
        end, {})
    end,
}
