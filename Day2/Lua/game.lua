local game = {
    strategy = {}, -- from file input
    to_score = {}, -- rules differ for each round
    to_int = {
        ['A'] = 0,
        ['B'] = 1,
        ['C'] = 2,
        ['X'] = 0,
        ['Y'] = 1,
        ['Z'] = 2
    },

    new = function( self, filename ) -- "constructor"
        local lines = {}
        local file = io.open(filename, 'r')
        if file then
            for line in io.lines( filename ) do
                lines[#lines+1] = line
            end
            self.strategy = lines
            io.close(file)
        else
            print("the file was not found")
        end
    end,

    split_string = function( self, line )
        -- returns a table with op:string, me:string
        local out = {}
        for str in string.gmatch(line, "([^".."%s".."]+)") do
            table.insert(out, str)
        end
        return out
    end,

    determine_win = function ()
       error("Method `determine_win()` must be implemeted in child class",2)
    end,

    get_score = function ()
       error("Method `get_score()` must be implemeted in child class",2)
    end
}

return game
