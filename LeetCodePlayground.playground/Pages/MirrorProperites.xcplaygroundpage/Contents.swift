//: [Previous](@previous)

import Foundation

struct Person: Testable {
    let name: String
    let age: Int
}

let tiago = Person(name: "Tiago", age: 44)

tiago.allProperties()
