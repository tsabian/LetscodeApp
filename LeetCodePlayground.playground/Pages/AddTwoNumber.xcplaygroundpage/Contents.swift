//: [Previous](@previous)

import Foundation

let solution = AddTwoNumbersSolution()

let list1 = ListNode(2, ListNode(4, ListNode(3)))
let list2 = ListNode(5, ListNode(6, ListNode(4)))

guard let result = solution.addTwoNumbers(list1, list2) else {
    fatalError("No result")
}

print(result.val)
print(result.next?.val ?? 0)
print(result.next?.next?.val ?? 0)
