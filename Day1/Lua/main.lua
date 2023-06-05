-- getting the lines from a file
local cal = {
    sum = 0,
    max = 0,
    array = {},
    get_file = function( filename )
        local lines = {} -- empty table
        for line in io.lines( filename ) do
            lines[#lines+1] = line
        end
        return lines
    end,

    top_three_sum = function ( cal_array )
        local array = {}
        for i, v in ipairs( cal_array ) do
            array[#array+1] = v
        end
        table.sort( array ) -- sort from least to greatest
        return array[#array] + array[#array-1] + array[#array-2]
    end
}

function Main()
    local lines = cal.get_file( "input.txt" )

    -- Part 1
    for i,v in ipairs(lines) do
        if v == '' then
            if cal.sum > cal.max then
                cal.max = cal.sum
            end
            table.insert(cal.array, cal.sum)
            cal.sum = 0
        else
            cal.sum = cal.sum + tonumber(v)
        end
    end

    -- Part 2
    local top_three = cal.top_three_sum( cal.array )

    print("[Part 1] Maximum Calories : "..cal.max.." cal")
    print("[Part 2] Top 3 Calories : "..top_three.." cal")
end

Main()
