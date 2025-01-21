local function open_nvim_tree()
    local nvim_tree_api = require("nvim-tree.api")
    nvim_tree_api.tree.open()
    nvim_tree_api.tree.change_root(vim.fn.getcwd())
    nvim_tree_api.tree.reload()
end

return {
    "rmagatti/auto-session",
    lazy = false,
    priority = 500,

    ---@module "auto-session"
    ---@type AutoSession.Config
    config = function()
        local auto_session = require("auto-session")

        -- Set nvim session options
        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

        auto_session.setup({
            enabled = true, -- Enables/disables auto creating, saving and restoring
            auto_save = true, -- Enables/disables auto saving session on exit
            auto_restore = true, -- Enables/disables auto restoring session on start
            auto_create = function() -- Only automatically create a session if directory is a git one
                local cmd = "git rev-parse --is-inside-work-tree"
                return vim.fn.system(cmd) == "true\n"
            end,
            suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            bypass_save_filetypes = { "NvimTree", "dashboard" }, -- List of filetypes to bypass auto save when the only buffer open is one of the file types listed, useful to ignore dashboards
            args_allow_single_directory = true, -- Follow normal sesion save/load logic if launched with a single directory as the only argument
            show_auto_restore_notif = false, -- Whether to show a notification when auto-restoring
            log_level = "error",

            post_restore_cmds = {
                open_nvim_tree, -- Restore nvim-tree after a session is restored
            },

            no_restore_cmds = {
                open_nvim_tree, -- Open nvim tree
            },

            session_lens = {
                load_on_setup = false,
            },
        })
    end,
}
