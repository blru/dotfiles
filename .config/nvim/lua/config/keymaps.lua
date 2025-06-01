return {
    -- General functionality used by various plugins or for nvim itself
    general = {
        -- Keys for navigating through list popup menus such as telescope, cmp and the vim command line
        popup_menu_up = "<C-k>",
        popup_menu_down = "<C-j>",

        -- Keys for navigating through information popup menus like telescope's file preview and cmp's docs
        popup_menu_secondary_up = "<C-u>",
        popup_menu_secondary_down = "<C-d>",

        save_file = "<C-s>", -- Runs :w
        toggle_wrap = "<A-z>", -- Runs :set wrap!

        -- Buffer related
        delete_buffer = "<leader>q", -- Closes the current buffer and goes to the previous buffer
        previous_buffer = "<C-S-Tab>", -- Goes to the previous buffer
        next_buffer = "<C-Tab>", -- Goes to the next buffer

        -- Line movement similar to other editors
        move_lines_up = "<A-k>",
        move_lines_down = "<A-j>",

        toggle_hardcore = "<leader>hard", -- Enables hardcore mode
    },

    -- Functionality to do with toggleterm
    terminal = {
        toggle_visible = "<C-`>", -- Key used to toggle the terminal's visibility
        show_terminals = "<leader>tl", -- Opens a select menu listing the terminals
    },

    -- Functionality to do with cmp
    completion = {
        suggest_completions = "<C-Space>", -- Key used to open the cmp menu on command
        complete = "<Tab>", -- Key used to do a completion
        snippet_forward = "<C-L>", -- Key used to go forward in a snippet
        snippet_backward = "<C-H>", -- Key used to go backward in a snippet
    },

    -- Functionality using conform
    formatting = {
        format_buffer = "<leader>pp", -- Formats the current buffer
    },

    -- Functionality using telescope
    telescope = {
        find_files = "<C-P>", -- Find files in current working directory by name
        find_buffers = "<C-G>", -- Find currently opened buffers
        find_string = "<leader>fs", -- Find a string within the files in the current working directory
        find_recent = "<leader>fr", -- Find files in current working directory by name
        find_todos = "<leader>ft", -- Find all the TODOs and other such comments within the current working directory
    },

    -- General lsp functionality (mostly self-explanatory)
    lsp = {
        smart_rename = "<leader>rn",
        show_references = "gR",
        goto_declaration = "gD",
        show_definitions = "gd",
        show_implementations = "gi",
        show_type_definitions = "<leader>gt",
        show_line_diagnostics = "<leader>ge",
        show_available_code_actions = "<leader>ca", -- Show possible actions suggested by the lsp
        show_documentation = "K", -- Shows documentation for what's under the cursor
    },

    -- Functionality using vim-maximizer
    maximizer = {
        toggle = "<leader>z",
    },

    -- Functionality using nvim-tree
    nvim_tree = {
        toggle = "<leader>ee",
        toggle_current_file = "<leader>ef",
    },

    -- Functionality using trouble.nvim
    trouble = {
        toggle_diagnostics = "<leader>xx", -- Toggles the visibility of Trouble's diagnostics window
    },

    -- Functionality using nvim-dap and other debugging stuff
    nvim_dap = {
        set_conditional_breakpoint = "<leader>dB",
        toggle_breakpoint = "<leader>db",
        toggle_log_breakpoint = "<leader>dn",
        continue = "<leader>dc",
        run_to_cursor = "<leader>dC",
        step_into = "<leader>di",
        down = "<leader>dj",
        up = "<leader>dk",
        run_last = "<leader>dl",
        step_out = "<leader>do",
        step_over = "<leader>dO",
        pause = "<leader>dp",
        toggle = "<leader>dr",
        terminate = "<leader>dt",
        widgets = "<leader>dw",
    },

    -- Functionality relating to  overseer.nvim
    overseer = {
        run = "<leader>oo",
        toggle = "<leader>oe",
        restart_last_task = "<leader>or",
    },

    -- Functionality for nvim-notify
    nvim_notify = {
        dismiss_all = "<leader>ec", -- Dismisses all notifications
        find_notifications = "<leader>ev", -- List all notifications in telescope
    },

    -- Functionality for ccc.nvim
    ccc = {
        open_picker = "<leader>cc",
    },

    -- Functionality for aerial.nvim
    aerial = {
        toggle_nav = "<C-S-G>",
    },

    -- File-type specific functionality
    file_specific = {
        ["*"] = {
            open_documentation_website = "<leader>rw",
        },
        rust = {},
    },
}
