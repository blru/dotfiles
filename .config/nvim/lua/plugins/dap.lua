local keymaps = require("config.keymaps")

local function continue()
    if vim.fn.filereadable(".vscode/launch.json") then
        require("dap.ext.vscode").load_launchjs()
    end
    require("dap").continue()
end

-- Most of this config taken from lazyvim.org and tjdevries/config.nvim
return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
        },
        keys = {
            {
                keymaps.nvim_dap.set_conditional_breakpoint,
                function()
                    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
                end,
                desc = "Breakpoint Condition",
            },
            {
                keymaps.nvim_dap.toggle_log_breakpoint,
                function()
                    require("dap").toggle_breakpoint(nil, nil, vim.fn.input("Log message: "))
                end,
                desc = "Toggle Breakpoint",
            },
            {
                keymaps.nvim_dap.toggle_breakpoint,
                function()
                    require("dap").toggle_breakpoint()
                end,
                desc = "Toggle Breakpoint",
            },
            {
                keymaps.nvim_dap.continue,
                continue,
                desc = "Continue",
            },
            {
                keymaps.nvim_dap.run_to_cursor,
                function()
                    require("dap").run_to_cursor()
                end,
                desc = "Run to Cursor",
            },
            {
                keymaps.nvim_dap.step_into,
                function()
                    require("dap").step_into()
                end,
                desc = "Step Into",
            },
            {
                keymaps.nvim_dap.down,
                function()
                    require("dap").down()
                end,
                desc = "Down",
            },
            {
                keymaps.nvim_dap.up,
                function()
                    require("dap").up()
                end,
                desc = "Up",
            },
            {
                keymaps.nvim_dap.run_last,
                function()
                    require("dap").run_last()
                end,
                desc = "Run Last",
            },
            {
                keymaps.nvim_dap.step_out,
                function()
                    require("dap").step_out()
                end,
                desc = "Step Out",
            },
            {
                keymaps.nvim_dap.step_over,
                function()
                    require("dap").step_over()
                end,
                desc = "Step Over",
            },
            {
                keymaps.nvim_dap.pause,
                function()
                    require("dap").pause()
                end,
                desc = "Pause",
            },
            {
                keymaps.nvim_dap.toggle,
                function()
                    require("dap").repl.toggle()
                end,
                desc = "Toggle REPL",
            },
            {
                keymaps.nvim_dap.terminate,
                function()
                    require("dap").terminate()
                end,
                desc = "Terminate",
            },
            {
                keymaps.nvim_dap.widgets,
                function()
                    require("dap.ui.widgets").hover()
                end,
                desc = "Widgets",
            },
        },
        config = function()
            local dap = require("dap")
            local ui = require("dapui")

            ui.setup()

            -- Setup icons
            local signs = {
                Breakpoint = { "", "red" },
                BreakpointCondition = { "", "red" },
                LogPoint = { "", "red" },
                Stopped = { "", "yellow" },
                BreakpointRejected = { "", "gray" },
            }
            for type, iconColorPair in pairs(signs) do
                local icon, color = unpack(iconColorPair)

                local hl = "Dap" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = color, numhl = "" })
            end

            -- Setup adapters
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = "codelldb",
                    args = { "--port", "${port}" },
                },
            }

            dap.adapters.firefox = {
                type = "executable",
                command = "firefox-debug-adapter",
                args = {},
            }

            dap.configurations.cpp = {
                {
                    name = "Launch C++ Executable (Path)",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }

            -- setup dap config by VsCode launch.json file
            local vscode = require("dap.ext.vscode")
            local json = require("plenary.json")
            vscode.json_decode = function(str)
                return vim.json.decode(json.json_strip_comments(str))
            end

            -- setup events
            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()

                -- HACK: Hack to fix nvim-tree size after debugging is finished
                local tree = require("nvim-tree.api").tree
                tree.toggle({ focus = false })
                tree.toggle({ focus = false })
            end
        end,
    },
}
