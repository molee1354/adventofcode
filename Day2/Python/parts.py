class Parts:
    def __init__(self, lines: list[str]) -> None:
        self.strategy = [ line.strip().split() for line in lines ]

    def determine_score(self, op: str, me: str) -> int:
        raise NotImplementedError("Subclass must implement this method")

    def get_score(self) -> int:
        raise NotImplementedError("Subclass must implement this method")

    def idx(self, input: str) -> int:
        if input in ['A', 'X']:
            return 0
        elif input in ['B', 'Y']:
            return 1
        elif input in ['C', 'Z']:
            return 2
        else:
            return -1

    def determine_win(self, op: str, me: str) -> int:
        """
        Returns 6 for player win, 3 for draw, 0 for loss
        """
        if ( self.idx(op)+1 )%3 == self.idx(me):
            return 6
        elif self.idx(op) == self.idx(me):
            return 3
        else:
            return 0


class Part1(Parts):
    def __init__(self, lines: list[str]) -> None:
        super().__init__(lines)
        self.score_guide = {
                'X' : 1,
                'Y' : 2,
                'Z' : 3
                }

    def determine_score(self, op: str, me: str) -> int:
        return self.determine_win(op, me) + self.score_guide[me]

    def get_score(self) -> int:
        total_score = 0
        for game in self.strategy:
            total_score += self.determine_score(game[0], game[1])

        return total_score


class Part2(Parts):
    def __init__(self, lines: list[str]) -> None:
        super().__init__(lines)
        self.win_guide = {
                'X' : 0, 
                'Y' : 3, 
                'Z' : 6
                }
        self.score_guide = {
                'A' : 1, 
                'B' : 2, 
                'C' : 3
                }

    def get_score(self) -> int:
        total_score = 0
        for game in self.strategy:
            total_score += self.determine_score(game[0], game[1])

        return total_score


    def determine_score(self, op: str, me: str) -> int:
        return self.win_guide[me] + self.determine_self(op, me)

    def determine_self(self, op: str, res: str) -> int:
        if res == 'X': # need to win
            for me in ['A', 'B', 'C']:
                if self.determine_win(op, me) == 0:
                    return self.score_guide[me]
        elif res == 'Y': # need to draw
            for me in ['A', 'B', 'C']:
                if self.determine_win(op, me) == 3:
                    return self.score_guide[me]
        elif res == 'Z': # need to lose
            for me in ['A', 'B', 'C']:
                if self.determine_win(op, me) == 6:
                    return self.score_guide[me]
        else:
            return -1 # error case

        


