//: [Previous](@previous)

import Foundation

let fibonacci = Fibonacci()

measurePerformance {
    print(fibonacci.run(count: 40))
}.formattedTime
