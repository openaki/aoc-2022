import std/strutils

let testInput = """
A Y
B X
C Z
"""


proc solvea(input: string) : int =
    var score = 0
    for l in input.strip.splitLines():
        let rnd = l.splitWhitespace()
        let opp:int = cast[int](rnd[0][0]) - cast[int]('A') + 1
        let me : int = cast[int](rnd[1][0]) - cast[int]('X') + 1
        var won = 0

        if opp == 1 and me == 3: won = 0
        elif opp == 3 and me == 1: won = 6
        elif opp == me : won = 3
        elif opp < me: won = 6
        score += won + me
    return score

proc solveb(input: string) : int =
    var score = 0
    for l in input.strip.splitLines():
        let rnd = l.splitWhitespace()
        let opp : int = cast[int](rnd[0][0]) - cast[int]('A')
        let expectedResult : int = (cast[int](rnd[1][0]) - cast[int]('X')) * 3
        var me = opp
        if expectedResult == 6:
            me = (opp + 1) mod 3
        if expectedResult == 0:
            me = (opp - 1 + 3) mod 3
        score += expectedResult + me + 1
    return score


echo "Test Input: A ", solvea(testInput)
echo "Solve: A ", solvea(readFile("./inputs/input02.txt"))
echo "Test Input: B ", solveb(testInput)
echo "Solve: B ", solveb(readFile("./inputs/input02.txt"))


