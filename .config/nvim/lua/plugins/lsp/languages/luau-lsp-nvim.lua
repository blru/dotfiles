-- This plugin is so based ngl
return {
    "lopi-py/luau-lsp.nvim",
    opts = {
        platform = {
            type = "roblox",
        },
        types = {
            roblox_security_level = "PluginSecurity",
        },
        sourcemap = {
            enabled = true,
            autogenerate = true, -- automatic generation when the server is attached
            rojo_project_file = "default.project.json",
            sourcemap_file = "sourcemap.json",
        },
        plugin = {
            enabled = true,
            port = 3667,
        },
        server = {
            settings = {
                -- https://github.com/folke/neoconf.nvim/blob/main/schemas/luau_lsp.json
                ["luau-lsp"] = {},
            },
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
