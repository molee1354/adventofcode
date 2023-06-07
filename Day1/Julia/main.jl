using Printf

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

function get_max_cal( cal_array::Vector{String} )
    cal_sum::Int = 0
    cal_max::Int = 0
    cal_sum_arr = Vector{Int}()

    for cal in cal_array
        if cal == ""
            if cal_sum > cal_max
                cal_max = cal_sum
            end
            push!(cal_sum_arr, cal_sum)
            cal_sum = 0
        else
            cal_sum += parse(Int, cal)
        end
    end
    sort!(cal_sum_arr, rev=true)
    @printf("[Part 1] Max Cal : %d cal\n", cal_max)
    @printf("[Part 2] Top 3 sum : %d cal\n", sum(cal_sum_arr[1:3]))
end

function main()
    lines::Vector{String} = get_file("input.txt")
    get_max_cal(lines)
end

main()
