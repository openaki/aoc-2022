import std/strutils, tables, itertools, sets



let testInput = """
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"""

func getCharScore(c: char): int =
    if c >= 'a' and c <= 'z':
        return cast[int](c) - cast[int]('a') + 1
    if c >= 'A' and c <= 'Z':
        return cast[int](c) - cast[int]('A') + 27

    raise newException(ValueError, "Out of range")

proc solveA(input: string): int =
    for i in input.strip.splitLines:
        let subLen : int = i.len() div 2
        let lc = i[0..<subLen]
        let rc = i[subLen..<i.len()]
        let lcTable = toCountTable(lc)
        var scoreAdded = initCountTable[char]()
        for c in rc:
            if lcTable.hasKey(c) and not scoreAdded.hasKey(c):
                scoreAdded.inc(c)
                result += getCharScore(c)


proc solveB(input: string): int =
    for i in input.strip.splitLines.chunked(3):
        #echo i.mapIt(it.toHashSet).foldl(a.intersection(b)).map(getCharScore)
        var match = i[0].toHashSet()
        for j in i:
            match = match.intersection(j.toHashSet())

        for m in match:
            result += getCharScore(m)

echo "Solve Test A ", solveA(testInput)
echo "Solve A ", solveA(readFile("./inputs/input03.txt"))
echo "Solve Test B ", solveB(testInput)
echo "Solve B ", solveB(readFile("./inputs/input03.txt"))
