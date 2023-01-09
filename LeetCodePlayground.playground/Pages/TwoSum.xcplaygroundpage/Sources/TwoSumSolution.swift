import Foundation

/**
 # Two Sum
 https://leetcode.com/problems/two-sum/
 */
public class TwoSumSolution {
    
    /// Initialize a new instance of TwoSumSolution.
    public init() {}
    
    /// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
    /// - Important: You may assume that each input would have exactly one solution, and you may not use the same element twice.
    /// - Note: You can return the answer in any order.
    /// - Parameters:
    ///    - num: The array of integers.
    ///    - target: A integer target.
    ///
    ///    ~~~
    ///    ## Example 1:
    ///
    ///    Input: nums = [2,7,11,15], target = 9
    ///    Output: [0,1]
    ///    Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
    ///
    ///    ## Example 2:
    ///
    ///    Input: nums = [3,2,4], target = 6
    ///    Output: [1,2]
    ///
    ///    ## Example 3
    ///
    ///    Input: nums = [3,3], target = 6
    ///    Output: [0,1]
    ///    ~~~
    ///
    /// - Returns: return indices of the two numbers such that they add up to target.
    public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var results = [Int]()
        for i in 0...nums.count {
            for j in i...nums.count {
                if let next = nums.next(from: j), (nums[i] + next.element) == target {
                    results.append(i)
                    results.append(next.index)
                }
            }
        }
        return results
    }
    
    public func twoSumSite(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]() // value : index
        for (i, num) in nums.enumerated() {
            if let index = dict[target - num] {
                return [i, index]
            }
            dict[num] = i
        }
        return []
    }
}
