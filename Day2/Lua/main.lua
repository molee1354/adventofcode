
local part1 = require("part1")
local part2 = require("part2")

local printf = function(format, vars)
    print(string.format(format, vars))
end

function Main()
    local filename = "input.txt"
    part1:new(filename)
    part2:new(filename)

    printf("[Part 1] Total Score : %d", part1:get_score())
    printf("[Part 2] Total Score : %d", part2:get_score())
end

Main()
