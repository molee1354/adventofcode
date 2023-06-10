include("./rucksack.jl")

using Printf
using .Rucksack

function main()
    lines = Rucksack.get_file( ARGS[1] )
    @printf("[Part 1] Total score : %d\n", Rucksack.part_1(lines) )
    @printf("[Part 2] Total score : %d\n", Rucksack.part_2(lines) )
end

main()