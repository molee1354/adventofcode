local part2 = require("game")

part2.to_score = {
    ['X'] = 0,
    ['Y'] = 3,
    ['Z'] = 6
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

local my_move = function( self, me )
    local op_moves = {'A', 'B', 'C'}
    if me == 'X' then --you need to lose
        for i, op_move in ipairs(op_moves) do
            if self.determine_win(op_move, me) == 0 then
                return self.to_int[op_moves]
            end
        end
    elseif me == 'Y' then --you need to lose
        for i, op_move in ipairs(op_moves) do
            if self.determine_win(op_move, me) == 3 then
                return self.to_int[op_moves]
            end
        end
    elseif me == 'Z' then 
        for i, op_move in ipairs(op_moves) do
            if self.determine_win(op_move, me) == 6 then
                return self.to_int[op_moves]
            end
        end
    else
        return -1
    end

end

function part2:get_score()
    local score = 0
    for i, round in ipairs(self.strategy) do
        local move = part2:split_string(round)
        -- " attempt to perform arithmetic on a nil value "
        score = score + (part2.to_score[move[2]] + my_move(part2, move[2]))

    end
    return score
end

return part2
