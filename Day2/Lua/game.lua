local part1 = {
    strategy = {}
}

function part1:new( filename )
    local lines = {} -- empty table
    local file = io.open(filename, 'r')
    if file then
        for line in io.lines( filename ) do
            lines[#lines+1] = line
            print(line)
        end
        part1.strategy = lines
        io.close(file)
    else
        print("the file was not found")
    end
end

function part1:determine_win( op, me )
    if (op+1)%3 == me then
        return 6
    elseif op == me then
        return 3
    else
        return 0
    end
end

return part1
