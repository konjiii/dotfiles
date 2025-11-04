-- complicated function for dynamicNode.
local function pydocsnip(args, _, old_state)
    -- nodes to hold the snippet nodes
    local nodes = {
        t({ '"""' }),
        i(1, "A short Description"),
        t({ "." }),
    }

    local params = args[1][1]
    local return_type = args[2][1]
    local return_index = 1

    -- if at least one param create the Args: section
    if string.len(params) ~= 0 then
        vim.list_extend(nodes, { t({ "", "\t", "\tArgs:", "\t" }) })
        -- loop over all parameters
        for indx, param in ipairs(vim.split(params, ", ", true)) do
            -- get actual parameter name
            local param_name = vim.split(param, ":", true)[1]

            -- create an entry and new insert node in docstring for each parameter
            vim.list_extend(
                nodes,
                { t({ "\t" .. param_name .. ": " }), i(indx + 1, "parameter description"), t({ ".", "\t" }) }
            )
            return_index = indx + 2
        end
    end

    -- if return type is not None, add return docstring
    if return_type ~= "None" then
        vim.list_extend(
            nodes,
            { t({ "", "\tReturns:", "\t\t" }), i(return_index, "return value description"), t({ ".", "\t" }) }
        )
    end

    vim.list_extend(nodes, { t({ '"""', "\t" }) })

    local snip = sn(nil, nodes)

    return snip
end

return {
    -- Function definition snippet
    s("def", {
        t("def "),
        i(1, "function_name"), -- function name
        t("("),
        i(2, ""), -- parameters
        t(")"),
        t(" -> "),
        i(3, "None"), -- return type
        t({ ":", "\t" }),
        d(4, pydocsnip, { 2, 3 }), -- dynamic docstring based on params and return type
        i(0, "pass"), -- function body
    }),
}
