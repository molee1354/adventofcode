local helper = {}

function helper.get_file( filename )
    local lines = {} -- empty table
    for line in io.lines( filename ) do
        lines[#lines+1] = line
    end
    return lines
end

function helper.max_cal( cal_array )
    local array = {}
    for i, v in ipairs( cal_array ) do
        array[#array+1] = v
    end
    table.sort(array) -- sort from lowerst to highest

    return array[#array]
end

return helper
