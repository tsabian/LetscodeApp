//: [Previous](@previous)

import Foundation

let solution = AddTwoNumbersSolution()

var list1 = ListNode(2, ListNode(4, ListNode(3)))
var list2 = ListNode(5, ListNode(6, ListNode(4)))
var result: ListNode?

measurePerformance {
    result = solution.addTwoNumbers(list1, list2)
}.formattedTime

if let node = result {
    print(node.resultNode())
}

list1 = ListNode(0)
list2 = ListNode(0)

measurePerformance {
    result = solution.addTwoNumbers(list1, list2)
}.formattedTime

if let node = result {
    print(node.resultNode())
}

list1 = ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9))))))
list2 = ListNode(9, ListNode(9, ListNode(9, ListNode(9))))

measurePerformance {
    result = solution.addTwoNumbers(list1, list2)
}.formattedTime

if let node = result {
    print(node.resultNode())
}
