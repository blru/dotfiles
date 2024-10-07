return {
    "tiagovla/tokyodark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyodark").setup({})
        vim.cmd(":colorscheme tokyodark")
    end,
}
