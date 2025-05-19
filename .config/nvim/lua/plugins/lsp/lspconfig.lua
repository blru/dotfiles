local keymaps = require("config.keymaps")

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "mrcjkb/rustaceanvim",
    },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- Setup icons
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = "󰠠",
                    [vim.diagnostic.severity.HINT] = "",
                },
                texthl = {
                    [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                    [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                    [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
                    [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                },
            },
            severity_sort = true,
            virtual_text = true,
        })

        -- Setup language servers
        vim.lsp.config("*", {
            capabilities = cmp_nvim_lsp.default_capabilities(),
        })

        local function configure_lsp(name, config)
            if config == nil then
                config = {}
            end

            vim.lsp.config(name, config)
            vim.lsp.enable(name)
        end

        configure_lsp("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }, -- Suppress warning
                    },
                },
            },
        })
        configure_lsp("ts_ls", {
            init_options = {
                plugins = {
                    -- TODO: Add vue language server support
                    -- {
                    --     name = "@vue/typescript-plugin",
                    --     location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
                    --     languages = { "javascript", "typescript", "vue" },
                    -- },
                },
            },
            filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        })
        configure_lsp("luau_lsp")
        configure_lsp("volar")
        configure_lsp("emmet_ls")
        configure_lsp("clangd")
        configure_lsp("cssls")
        configure_lsp("html")
        configure_lsp("jsonls")
        configure_lsp("pyright")
        configure_lsp("astro")

        -- Keymaps from https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/plugins/lsp/lspconfig.lua
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local options = { buffer = ev.buf, silent = true }

                options.desc = "Smart rename"
                vim.keymap.set("n", keymaps.lsp.smart_rename, vim.lsp.buf.rename, options) -- Smart rename

                options.desc = "Go to declaration"
                vim.keymap.set("n", keymaps.lsp.goto_declaration, vim.lsp.buf.declaration, options) -- Go to declaration

                options.desc = "See available code actions"
                vim.keymap.set({ "n", "v" }, keymaps.lsp.show_available_code_actions, vim.lsp.buf.code_action, options) -- see available code actions, in visual mode will apply to selection

                options.desc = "Show documentation for what is under cursor"
                vim.keymap.set("n", keymaps.lsp.show_documentation, vim.lsp.buf.hover, options) -- show documentation for what is under cursor

                options.desc = "Show diagnostics information for what is under cursor"
                vim.keymap.set("n", keymaps.lsp.show_line_diagnostics, vim.diagnostic.open_float, options) -- show diagnostics under cursor
            end,
        })
    end,
}
