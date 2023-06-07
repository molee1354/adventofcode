local part1 = require("game")

-- define the rules for part 1
part1.to_score = {
    ['X'] = 1,
    ['Y'] = 2,
    ['Z'] = 3
}

function part1:determine_win( op, me )
    if ( self.to_int[op]+1)%3 == self.to_int[me] then
        return 6 + self.to_score[me]
    elseif self.to_int[op] == self.to_int[me] then
        return 3 + self.to_score[me]
    else
        return 0 + self.to_score[me]
    end
end

function part1:get_score()
    local score = 0
    for i, round in ipairs(self.strategy) do
        local move = part1:split_string(round)
        score = score + part1:determine_win(move[1], move[2])
    end
    return score
end

return part1
