local part2 = require("game")

part2.to_score = {
    ['X'] = 0,
    ['Y'] = 3,
    ['Z'] = 6,
    ['A'] = 1,
    ['B'] = 2,
    ['C'] = 3
}

function part2:determine_win( op, me )
    if ( part2.to_int[op]+1)%3 == part2.to_int[me] then
        return 6
    elseif part2.to_int[op] == part2.to_int[me] then
        return 3
    else
        return 0
    end
end

local my_move = function( self, op, res )
-- local function my_move(self, me)
-- function part2:my_move( me )
    local moves = {'A', 'B', 'C'}
    if res == 'X' then --you lose
        for i, me in ipairs(moves) do
            if self:determine_win(op, me) == 0 then
                return self.to_score[me]
            end
        end
    elseif res == 'Y' then --you draw
        for i, me in ipairs(moves) do
            if self:determine_win(op, me) == 3 then
                return self.to_score[me]
            end
        end
    elseif res == 'Z' then --you win
        for i, me in ipairs(moves) do
            if self:determine_win(op, me) == 6 then
                return self.to_score[me]
            end
        end
    else
        return -1
    end

end

local add_score = function( self, op, me )
    return part2.to_score[me] + my_move(self, op, me)
end

function part2:get_score()
    local score = 0
    for i, round in ipairs(part2.strategy) do
        local move = part2:split_string(round)
        -- " attempt to perform arithmetic on a nil value "
        score = score + add_score(part2, move[1], move[2])

    end
    return score
end

return part2
