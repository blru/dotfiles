local base_clang_arguments = "-Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -pedantic-errors -std=c++17"

return {
    name = "clang++ run",
    builder = function()
        local outfile = "/tmp/overseer-build.out"

        return {
            cmd = { outfile },
            components = {
                { "on_output_quickfix", open = false },
                "default",
            },
        }
    end,
    condition = {
        filetype = { "cpp" },
    },
}
