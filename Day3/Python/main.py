
import sys
import rucksack


def main() -> None:
  ruck = rucksack.Ruck(sys.argv[1])
  print(f"[Part 1] Answer : {ruck.part1()}")
  print(f"[Part 2] Answer : {ruck.part2()}")


if __name__ == "__main__":
  main()
