---function that generates a function docstring snippet
---@param args table
---@param _ table
local function luafndocsnip(args, _)
    -- nodes to hold the snippet nodes
    local nodes = {
        t({ "---" }),
        i(1, "A short Description"),
    }

    local params = args[1][1]

    -- if at least one param create the @param lines
    if string.len(params) ~= 0 then
        -- loop over all parameters
        for indx, param in ipairs(vim.split(params, ", ")) do
            -- create a @param line for every parameter
            vim.list_extend(nodes, { t({ "", "---@param " .. param .. " " }), i(indx + 1, "type") })
        end
    end

    local snip = sn(nil, nodes)

    return snip
end

return {
    -- Function definition snippet
    s("fn", {
        d(4, luafndocsnip, { 3 }), -- dynamic docstring based on params and return type
        c(5, {
            { t({ "", "---@return " }), i(1, "type") },
            t(""),
        }),
        t({ "", "" }),
        c(1, { -- choose between normal and local function
            t("local "),
            t(""),
        }),
        t("function "),
        i(2, "function_name"), -- function name
        t("("),
        i(3, ""), -- parameters
        t({ ")", "\t" }),
        i(0, ""), -- function body
        t({ "", "end" }),
    }),
}
