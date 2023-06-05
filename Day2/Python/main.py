import parts

def main() -> None:
    with open("input.txt", 'r') as f:
        lines = f.readlines()
    
    part1 = parts.Part1( lines )
    part2 = parts.Part2( lines )

    print(f"[Part 1] Total Score : { part1.get_score() }")
    print(f"[Part 2] Total Score : { part2.get_score() }")


if __name__ == "__main__":
    main()
