local base_clang_arguments = "-Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -pedantic-errors -g -O0 -std=c++23"

return {
    name = "clang++ build",
    builder = function()
        local file = vim.fn.expand("%:p")
        local outfile = "/tmp/overseer-build.out"

        return {
            cmd = string.format("clang++ %s -o '%s' '%s'", base_clang_arguments, outfile, file),
            components = {
                "default",
                { "user.on-complete-close-toggleterm" },
                { "on_output_quickfix", open = false },
            },
        }
    end,
    condition = {
        filetype = { "cpp" },
    },
}

-- TODO: Add build and run release with additional arguments of `-O2 -DNDEBUG `
