from string import ascii_lowercase as ascl
import numpy as np

class Ruck:
  def __init__(self, filename: str) -> None:
    self.filename = filename
    self.priority = {}
    for i, letter in enumerate(ascl + ascl.upper()):
      self.priority[letter] = i + 1

    self.rucksacks = []
    with open(self.filename, 'r') as f:
      for l in f:
        self.rucksacks.append(l)

  def part1(self) -> int:
 
    # Find duplicates
    dups = []
    for sack in self.rucksacks:
      first_half = sack[:int(len(sack) // 2)]
      second_half = sack[int(len(sack) // 2):]
  
      for i in first_half:
        if i in second_half:
          dups.append(i)
          break
  
    # Find sum
    sum = 0
    for c in dups:
      sum += self.priority[c]
      
    return sum
  
  def part2(self) -> int: 
    # Find badges
    badges = []
    for i in np.arange(0, len(self.rucksacks), 3):
      for c in self.rucksacks[i]:
        if c in self.rucksacks[i+1] and c in self.rucksacks[i+2]:
          badges.append(c)
          break

    # Find sum
    sum = 0
    for c in badges:
      sum += self.priority[c]

    return sum
    