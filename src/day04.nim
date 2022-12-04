import strutils

let testInput = """
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
"""

type Range = object
    l: int
    h: int

func getRange(s: string): (Range, Range) =
    let ranges = s.split(",")
    let a = ranges[0].split("-")
    let b = ranges[1].split("-")
    return (Range(l: a[0].parseInt, h: a[1].parseInt),
            Range(l: b[0].parseInt, h: b[1].parseInt))


proc solveA(input: string, partialOverlap: bool = false): int =
    for l in input.strip.splitLines():
        let (a, b) = getRange(l)
        if a.l >= b.l and a.h <= b.h:
            result += 1
        elif b.l >= a.l and b.h <= a.h:
            result += 1
        elif partialOverlap:
            if (a.l >= b.l and a.l <= b.h) or
               (a.h >= b.l and a.h <= b.h) or
               (b.l >= a.l and b.l <= a.h) or
               (b.h >= a.l and b.h <= a.h):
                result += 1


        #echo a, " ", b


echo "Test input A: ", solveA(testInput)
echo "Solve A: ", solveA(readFile("./inputs/input04.txt"))

echo "Test input B: ", solveA(testInput, true)
echo "Solve B: ", solveA(readFile("./inputs/input04.txt"), true)
