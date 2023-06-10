module Rucksack

    priority = Dict{Char, Int}()
    for (value, letter) in enumerate(vcat( collect('a':'z'), collect('A':'Z')))
        priority[letter] = value
    end

    # function to get lines from a file
    function get_file( filename::String )::Vector{String}
        file = open(filename)
        lines = Vector{String}()

        for number in readlines(file)
            push!(lines, number)
        end 
        close(file)
        return lines
    end


    function part_1( rucksack::Vector{String} )::Int
        duplicates = Vector{Char}()
        sum::Int = 0

        for item_set in rucksack
            first_half = item_set[ 1:Int(length(item_set)/2) ]
            second_half = item_set[ Int(length(item_set)/2)+1:end ]

            for item in first_half
                if occursin(item, second_half)
                    push!(duplicates, item)
                    break
                end
            end
        end

        for item in duplicates
            sum += priority[item]
        end

        return sum
    end

    function part_2( rucksack::Vector{String} )::Int
        badges = Vector{Char}()
        sum::Int = 0

        for idx in 1:3:length(rucksack)
            for item in rucksack[idx]
                if occursin(item, rucksack[idx+1]) && occursin(item, rucksack[idx+2])
                    push!(badges, item)
                    break
                end
            end
        end

        for item in badges
            sum += priority[item]
        end

        return sum
    end

end