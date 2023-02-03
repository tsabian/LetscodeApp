import Foundation

public class Fibonacci {
    public init() {}

    public func run(count n: Int) -> [Int] {
        var numbers = [Int]()
        for i in 0..<n {
            numbers.append(generate(of: i))
        }
        return numbers
    }

    private func generate(of number: Int) -> Int {
        if number <= 1 {
            return number
        }
        return generate(of: number - 1) + generate(of: number - 2)
    }
}
