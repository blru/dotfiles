return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    ft = { "markdown" },
    enabled = false,
    opts = {
        render_modes = { "n", "v", "V", "i", "R", "t", "no", "c" },
        heading = {},
        sign = { enabled = false },
        html = {
            comment = {
                conceal = false,
            },
        },
        quote = {
            repeat_linebreak = true,
        },
    },
}
