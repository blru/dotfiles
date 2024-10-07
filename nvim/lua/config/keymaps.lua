return {
    -- General functionality used by various plugins
    general = {
        -- Keys for navigating through list popup menus such as telescope, cmp and the vim command line
        popup_menu_up = "<C-k>",
        popup_menu_down = "<C-j>",

        -- Keys for navigating through information popup menus like telescope's file preview and cmp's docs
        popup_menu_secondary_up = "<C-u>",
        popup_menu_secondary_down = "<C-d>",

        save_file = "<C-s>", -- Runs :w
        toggle_wrap = "<A-z>", -- Runs :set wrap!
    },

    -- Functionality to do with toggleterm
    terminal = {
        toggle_visible = "<C-`>", -- Key used to toggle the terminal's visibility
        show_terminals = "<leader>tl", -- Opens a select menu listing the terminals
    },

    -- Functionality to do with cmp
    completion = {
        suggest_completions = "<C-Space>", -- Key used to open the cmp menu on command
        confirm_completion_or_snippet_forward = "<Tab>", -- Key used to go complete or go forward in a snippet
        snippet_backward = "<S-Tab>", -- Key used to go backward in a snippet
        toggle_completion = "<leader>cop",
    },

    -- Functionality using conform
    formatting = {
        format_buffer = "<leader>pp", -- Formats the current buffer
    },

    -- Functionality using telescope
    telescope = {
        find_files = "<leader>ff", -- Find files in current working directory by name
        find_recent = "<leader>fr", -- Find files in current working directory by name
        find_string = "<leader>fs", -- Find a string within the files in the current working directory
        find_buffers = "<leader>fb", -- Find currently opened buffers
    },

    -- General lsp functionality (mostly self-explanatory)
    lsp = {
        smart_rename = "<leader>rn",
        show_references = "gR",
        goto_declaration = "gD",
        show_definitions = "gd",
        show_implementations = "gi",
        show_type_definitions = "<leader>gt",
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

    -- Functionality using nvim-dap and other debugging stuff
    nvim_dap = {
        set_conditional_breakpoint = "<leader>dB",
        toggle_breakpoint = "<leader>db",
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

    -- File-type specific functionality
    file_specific = {
        ["*"] = {
            run_single_file = "<leader>rr",
            run_single_file_release = "<leader>ro",
            open_documentation_website = "<leader>rw",
        },
        rust = {},
    },
}
