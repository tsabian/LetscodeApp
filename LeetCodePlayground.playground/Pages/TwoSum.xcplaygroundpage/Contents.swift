
let nums = [25, 25, 10, 40, 45, 5]
let target = 50

var dict = [Int: Int]()
for (i, num) in nums.enumerated() {
    debugPrint("\(target) - \(num) = \(target - num)")
    debugPrint("index of [target - num]) \(dict[target - num] ?? 0)")
    if let index = dict[target - num] {
        debugPrint("Match \([i, index]) for i added \(i) with value \(index)")
    }
    debugPrint("add element index \(num) with value \(i)")
    dict[num] = i
}
debugPrint(dict)

let solution = TwoSumSolution()

print(solution.twoSum([2, 7, 11, 15], 9))
print(solution.twoSum([3, 2, 4], 6))
print(solution.twoSum([3, 3], 6))
print(solution.twoSum([4, 4, 2, 4, 9, 3, 3], 6))
print(solution.twoSum([1, 2, 3, 4, 5, 6, 7, 8, 9, 0], 10))
print(solution.twoSum([25, 25, 10, 40, 45, 5], 50))
print(solution.twoSum([3, 2, 3], 6))
