return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "astro",
                "bash",
                "c",
                "cpp",
                "css",
                "glsl",
                "html",
                "http",
                "hyprlang",
                "javascript",
                "json",
                "lua",
                "luau",
                "markdown",
                "markdown_inline",
                "markdown_inline",
                "mermaid",
                "python",
                "query",
                "rust",
                "scss",
                "typescript",
                "vim",
                "vimdoc",
                "vue",
                "yaml",
                "yuck",
                "zig",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
