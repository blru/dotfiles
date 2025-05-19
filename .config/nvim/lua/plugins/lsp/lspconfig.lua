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
        local mason_registry = require("mason-registry")
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
        lspconfig.ts_ls.setup(extend_defaults({
            init_options = {
                plugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = mason_registry.get_package("vue-language-server"):get_install_path()
                            .. "/node_modules/@vue/language-server",
                        languages = { "vue" },
                    },
                },
            },
            filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        }))
        lspconfig.luau_lsp.setup(extend_defaults({}))
        lspconfig.volar.setup(extend_defaults({}))
        lspconfig.emmet_ls.setup(extend_defaults({}))
        lspconfig.clangd.setup(extend_defaults({}))
        lspconfig.cssls.setup(extend_defaults({}))
        lspconfig.html.setup(extend_defaults({}))
        lspconfig.jsonls.setup(extend_defaults({}))
        lspconfig.pyright.setup(extend_defaults({}))
        lspconfig.astro.setup(extend_defaults({}))

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
