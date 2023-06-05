-- getting the lines from a file
local function get_file( filename )
    local lines = {} -- empty table
    for line in io.lines( filename ) do
        lines[#lines+1] = line
    end
    return lines
end

function Main()
    local lines = get_file("input.txt")

    local cal_sum = 0
    local cal_arr= {}
    for i,v in ipairs(lines) do
        if v == '' then
            table.insert(cal_arr, cal_sum)
            cal_sum = 0
        else
            cal_sum += tonumber(v)
        end
    end
end

Main()
