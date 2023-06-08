
local printf = function(format, vars)
    print(string.format(format, vars))
end

function Main()
    local filename = "input.txt"

    local part1 = require("part1")
    part1:new(filename)
    printf("[Part 1] Total Score : %d", part1:get_score())

    local part2 = require("part2")
    part2:new(filename)
    printf("[Part 2] Total Score : %d", part2:get_score())
end

Main()
