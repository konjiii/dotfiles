---function that generates a function docstring snippet
---@param args table
---@param _ table
local function pyfndocsnip(args, _)
    -- parse args
    local params = args[1][1]
    local return_type = args[2][1]
    local is_method = args[3]

    -- nodes to hold the snippet nodes
    local nodes = {
        t({ '"""' }),
        i(1, "Summary of function"),
        t({ "." }),
    }

    local return_index = 2

    -- if at least one param create the Args: section
    if string.len(params) ~= 0 then
        vim.list_extend(nodes, { t({ "", "\t", "\tArgs:" }) })
        -- remove first , from params if method (to skip self)
        if is_method then
            params = params:gsub("^, ", "")
        end
        -- loop over all parameters
        for indx, param in ipairs(vim.split(params, ", ")) do
            -- get actual parameter name
            local param_name = vim.split(param, ":")[1]

            -- create an entry and new insert node in docstring for each parameter
            vim.list_extend(
                nodes,
                { t({ "", "\t\t" .. param_name .. ": " }), i(indx + 1, "parameter description"), t({ "." }) }
            )
            return_index = indx + 2
        end
    end

    -- if return type is not None, add return docstring
    if return_type ~= "None" then
        vim.list_extend(
            nodes,
            { t({ "", "", "\tReturns:", "\t\t" }), i(return_index, "return value description"), t({ "." }) }
        )
    end

    -- the ending """ should go on a new line if args or return sections were added
    if #nodes > 3 then
        vim.list_extend(nodes, { t({ "", "\t" }) })
    end

    vim.list_extend(nodes, { t({ '"""', "\t" }) })

    local snip = sn(nil, nodes)

    return snip
end

---function that generates a class docstring snippet
---@param args table
---@param _ table
local function pyclassdocsnip(args, _)
    -- nodes to hold the snippet nodes
    local nodes = {
        t({ '"""' }),
        i(1, "Summary of class"),
        t({ "." }),
    }

    local params = args[1][1]

    -- if at least one param create the Attributes: section
    if string.len(params) ~= 0 then
        vim.list_extend(nodes, { t({ "", "\t", "\tAttributes:" }) })
        -- remove first , from params (to skip self)
        params = params:gsub("^, ", "")
        -- loop over all parameters
        for indx, param in ipairs(vim.split(params, ", ")) do
            -- get actual parameter name
            local param_name = vim.split(param, ":")[1]

            -- create an entry and new insert node in docstring for each parameter
            vim.list_extend(
                nodes,
                { t({ "", "\t\t" .. param_name .. ": " }), i(indx + 1, "attribute description"), t({ "." }) }
            )
        end
    end

    -- the ending """ should go on a new line if Attributes were added
    if #nodes > 3 then
        vim.list_extend(nodes, { t({ "", "\t" }) })
    end

    vim.list_extend(nodes, { t({ '"""', "\t" }) })

    local snip = sn(nil, nodes)

    return snip
end

return {
    -- Function definition snippet
    s("fn", {
        t("def "),
        i(1, "function_name"), -- function name
        t("("),
        i(2, ""), -- parameters
        t(")"),
        t(" -> "),
        i(3, "None"), -- return type
        t({ ":", "\t" }),
        d(4, function(args, _)
            -- call pyfndocsnip with false for is_method
            vim.list_extend(args, { false })
            return pyfndocsnip(args, _)
        end, { 2, 3 }), -- dynamic docstring based on params and return type
        i(0, "pass"), -- function body
    }),
    -- Class definition snippet
    s("class", {
        t("class "),
        i(1, "ClassName"), -- class name
        t({ ":", "\t" }),
        d(3, pyclassdocsnip, { 2 }), -- dynamic docstring based on class content
        t("def __init__(self"),
        i(2, ""), -- init parameters
        t({ ") -> None:", "\t\t" }),
        i(0, "pass"), -- init body
    }),
    -- Class method snippet
    s("meth", {
        t("def "),
        i(1, "method_name"), -- function name
        t("(self"),
        i(2, ""), -- parameters
        t(")"),
        t(" -> "),
        i(3, "None"), -- return type
        t({ ":", "\t" }),
        d(4, function(args, _)
            -- call pyfndocsnip with true for is_method
            vim.list_extend(args, { true })
            return pyfndocsnip(args, _)
        end, { 2, 3 }), -- dynamic docstring based on params and return type
        i(0, "pass"), -- function body
    }),
}
