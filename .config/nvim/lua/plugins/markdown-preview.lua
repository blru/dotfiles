return {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_port = "8346"
        vim.g.mkdp_theme = "dark"
    end,
}
