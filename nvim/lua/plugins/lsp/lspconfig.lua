local keymaps = require("config.keymaps")

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "mrcjkb/rustaceanvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        -- Setup language servers
        local capabilities = cmp_nvim_lsp.default_capabilities()

        local function extend_defaults(options)
            options.capabilities = capabilities

            return options
        end

        -- TODO: Figure out how to make it so that only installed LSPs are configured
        lspconfig.lua_ls.setup(extend_defaults({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }, -- Suppress warning
                    },
                },
            },
        }))
        lspconfig.emmet_ls.setup(extend_defaults({}))
        lspconfig.ts_ls.setup(extend_defaults({}))
        lspconfig.clangd.setup(extend_defaults({}))

        -- Keymaps from https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/plugins/lsp/lspconfig.lua
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local options = { buffer = ev.buf, silent = true }

                options.desc = "Smart rename"
                vim.keymap.set("n", keymaps.lsp.smart_rename, vim.lsp.buf.rename, options) -- Smart rename

                options.desc = "Show LSP references"
                vim.keymap.set("n", keymaps.lsp.show_references, "<cmd>Telescope lsp_references<CR>", options) -- Show LSP references

                options.desc = "Go to declaration"
                vim.keymap.set("n", keymaps.lsp.goto_declaration, vim.lsp.buf.declaration, options) -- Go to declaration

                options.desc = "Show LSP definitions"
                vim.keymap.set("n", keymaps.lsp.show_definitions, "<cmd>Telescope lsp_definitions<CR>", options) -- Show lsp definitions

                options.desc = "Show LSP implementations"
                vim.keymap.set("n", keymaps.lsp.show_implementations, "<cmd>Telescope lsp_implementations<CR>", options) -- show lsp implementations

                options.desc = "Show LSP type definitions"
                vim.keymap.set(
                    "n",
                    keymaps.lsp.show_type_definitions,
                    "<cmd>Telescope lsp_type_definitions<CR>",
                    options
                ) -- show lsp type definitions

                options.desc = "See available code actions"
                vim.keymap.set({ "n", "v" }, keymaps.lsp.show_available_code_actions, vim.lsp.buf.code_action, options) -- see available code actions, in visual mode will apply to selection

                options.desc = "Show documentation for what is under cursor"
                vim.keymap.set("n", keymaps.lsp.show_documentation, vim.lsp.buf.hover, options) -- show documentation for what is under cursor
            end,
        })

        -- Language specific keymaps
    end,
}
