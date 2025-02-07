return {
    "kawre/leetcode.nvim",
    cmd = { "Leet" },
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
        "nvim-telescope/telescope.nvim",
        -- "ibhagwan/fzf-lua",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        lang = "cpp",
        injector = {
            ["python3"] = {
                before = true,
            },
            ["cpp"] = {
                before = { "#include <bits/stdc++.h>", "using namespace std;" },
                after = "int main() {}",
            },
        },
    },
}
