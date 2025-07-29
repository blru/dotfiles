local function makeCheckOneOfExecutablesExist(executables)
    local doesOneExist = nil -- The result is memoized

    return function()
        if doesOneExist == nil then
            doesOneExist = false

            for _, executable in ipairs(executables) do
                if vim.fn.executable(executable) == 1 then
                    doesOneExist = true
                    break
                end
            end
        end

        return doesOneExist
    end
end

return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
        local isPythonToolingInstalled = makeCheckOneOfExecutablesExist({ "py", "python", "python3" })
        local isRustToolingInstalled = makeCheckOneOfExecutablesExist({ "rustc", "cargo" })
        local isZigToolingInstalled = makeCheckOneOfExecutablesExist({ "zig" })

        -- TODO: Maybe in the future, lsps and formatters could automatically be added here

        require("mason-tool-installer").setup({
            -- a list of all tools you want to ensure are installed upon start
            ensure_installed = {
                -- Formatters
                "stylua",
                "prettier",
                "clang-format",
                {
                    "black",
                    condition = isPythonToolingInstalled,
                },

                -- LSPs
                "clangd",
                "css-lsp",
                "emmet-ls",
                "html-lsp",
                "json-lsp",
                "lua-language-server",
                "luau-lsp",
                "astro-language-server",
                "typescript-language-server",
                "vue-language-server",
                { "pyright", condition = isPythonToolingInstalled },
                { "rust-analyzer", condition = isRustToolingInstalled },
                { "zls", condition = isZigToolingInstalled },

                -- DAP
                "firefox-debug-adapter",
                "codelldb",
            },

            -- if set to true this will check each tool for updates. If updates
            -- are available the tool will be updated. This setting does not
            -- affect :MasonToolsUpdate or :MasonToolsInstall.
            -- Default: false
            auto_update = false,

            -- automatically install / update on startup. If set to false nothing
            -- will happen on startup. You can use :MasonToolsInstall or
            -- :MasonToolsUpdate to install tools and check for updates.
            -- Default: true
            run_on_start = false,

            -- set a delay (in ms) before the installation starts. This is only
            -- effective if run_on_start is set to true.
            -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
            -- Default: 0
            start_delay = 3000, -- 3 second delay

            -- Only attempt to install if 'debounce_hours' number of hours has
            -- elapsed since the last time Neovim was started. This stores a
            -- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
            -- This is only relevant when you are using 'run_on_start'. It has no
            -- effect when running manually via ':MasonToolsInstall' etc....
            -- Default: nil
            debounce_hours = 5, -- at least 5 hours between attempts to install/update

            -- By default all integrations are enabled. If you turn on an integration
            -- and you have the required module(s) installed this means you can use
            -- alternative names, supplied by the modules, for the thing that you want
            -- to install. If you turn off the integration (by setting it to false) you
            -- cannot use these alternative names. It also suppresses loading of those
            -- module(s) (assuming any are installed) which is sometimes wanted when
            -- doing lazy loading.
            integrations = {
                ["mason-lspconfig"] = false,
                ["mason-null-ls"] = false,
                ["mason-nvim-dap"] = false,
            },
        })
    end,
}
