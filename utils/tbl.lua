local tbl = {}

-- checks if an item is already in a table
tbl.is_duplicate = function (_table, new_item)
    for _, item in ipairs(_table) do
        if item == new_item then
            return true 
        end
    end
    return false
end

-- creates a table by splitting a given string by new lines
tbl.from_string = function (input)
    local result = {}
    for line in input:gmatch("([^\n]*)\n?") do
        if line ~= "" then
            table.insert(result, line)
        end
    end
    return result
end

-- merges two tables, overwriting the default values with the new ones
tbl.merge = function (default, overwrite)
    for k, v in pairs(overwrite) do
        if type(v) == "table" and type(default[k]) == "table" then
            tbl.merge(default[k], v)
        else
            default[k] = v
        end
    end
end

-- returns the keys of a table
tbl.keys = function (_table)
    local keys = {}
    for k, _ in pairs(_table) do
        table.insert(keys, k)
    end
    table.sort(keys, function(a, b) return a > b end)
    return keys
end

return tbl
