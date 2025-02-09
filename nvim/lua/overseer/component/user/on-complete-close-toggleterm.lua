local constants = require("overseer.constants")
local STATUS = constants.STATUS
local util = require("overseer.util")

return {
    desc = "Closes toggleterm on complete",
    params = {
        statuses = {
            desc = "List of statuses to close toggleterm on",
            type = "list",
            subtype = {
                type = "enum",
                choices = STATUS.values,
            },
            default = {
                STATUS.SUCCESS,
            },
        },
    },
    constructor = function(params)
        if type(params.statuses) == "string" then
            params.statuses = { params.statuses }
        end
        local lookup = util.list_to_map(params.statuses)

        return {
            last_status = nil,
            on_complete = function(self, task, status)
                if lookup[status] and task.strategy.term then
                    task.strategy.term:close()
                end
            end,
        }
    end,
}
