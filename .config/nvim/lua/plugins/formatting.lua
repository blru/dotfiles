local keymaps = require("config.keymaps")

return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },
    init = function()
        local conform = require("conform")

        -- Format options shared by format_on_save and format keymap
        local formatOptions = {
            timeout_ms = 500,
            async = false,
            lsp_format = "never",
        }

        -- Setup conform
        conform.setup({
            format_on_save = formatOptions,
            formatters_by_ft = {
                -- Lua
                lua = { "stylua" },
                luau = { "stylua" },

                -- JS/TS
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                vue = { "prettier" },

                -- CSS, etc
                css = { "prettier" },
                scss = { "prettier" },

                -- HTML
                html = { "prettier" },

                -- Rust
                rust = { lsp_format = "fallback" },

                -- Python
                python = { "black" },

                -- Cpp
                cpp = { "clang-format", lsp_format = "fallback" },

                -- Config
                json = { "prettier" },
                jsonc = { "prettier" },
                yaml = { "prettier" },

                -- Markdown
                markdown = { "prettier" },
                ["markdown.mdx"] = { "prettier" },
            },
            formatters = {
                prettier = {
                    command = "prettier",
                    prepend_args = { "--tab-width", "4" },
                },
                rustfmt = {},
            },
        })

        -- Format keymap
        vim.keymap.set({ "n", "v" }, keymaps.formatting.format_buffer, function()
            conform.format(formatOptions)
        end, { desc = "In normal mode, formats the current buffer. In visual mode, formats the selection." })

        -- Use conform as the formatter
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
