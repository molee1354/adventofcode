-- getting the lines from a file
local helper = require("helper")

function Main()
    local lines = helper.get_file("input.txt")

    local cal_sum = 0
    local cal_arr= {}
    for i,v in ipairs(lines) do
        if v == '' then
            table.insert(cal_arr, cal_sum)
            cal_sum = 0
        else
            cal_sum = cal_sum + tonumber(v)
        end
    end
    print(helper.max_cal( cal_arr ))
end

Main()
