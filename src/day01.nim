import strutils, algorithm

let testInput = """
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
"""

proc solvea(input: string, sumCount: int): int =
    var maxCal : seq[int] = @[]
    var current = 0
    for i in input.splitLines:
        if i == "":
            maxCal.add(current)
            current = 0
            continue
        current += parseInt(i)

    maxCal.add(current)
    maxCal.sort(SortOrder.Descending)
    for i in 0..<sumCount:
        result += maxCal[i]

echo "Solve Test A: " & solvea(testInput, 1).intToStr
echo "Solve A: " & solvea(readFile("./inputs/input01.txt"), 1).intToStr


echo "Solve Test B: " & solvea(testInput, 3).intToStr
echo "Solve B: " & solvea(readFile("./inputs/input01.txt"), 3).intToStr
