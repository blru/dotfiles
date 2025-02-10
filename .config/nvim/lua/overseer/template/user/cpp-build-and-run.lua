local base_clang_arguments = "-Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -pedantic-errors -std=c++17"

return {
    name = "clang++ build and run",
    builder = function()
        local outfile = "/tmp/overseer-build.out"

        return {
            cmd = { outfile },
            components = {
                {
                    "dependencies",
                    task_names = {
                        "clang++ build",
                    },
                },
                { "on_output_quickfix", open = false },
                "default",
            },
        }
    end,
    condition = {
        filetype = { "cpp" },
    },
}

-- TODO: Add build and run release with additional arguments of `-O2 -DNDEBUG `
