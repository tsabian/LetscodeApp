import Foundation

/**
 Você recebe duas listas vinculadas não vazias que representam dois inteiros não negativos.
 Os dígitos são armazenados na ordem inversa, e cada um de seus nós contém um único dígito.
 Adicione os dois números e retorne a soma como uma lista vinculada.

 Você pode assumir que os dois números não contêm nenhum zero à esquerda, exceto o próprio número 0.

 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.

 Input: l1 = [0], l2 = [0]
 Output: [0]

 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?

    public init() {
        val = 0
        next = nil
    }

    public init(_ val: Int) {
        self.val = val
        next = nil
    }

    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

public class AddTwoNumbersSolution {
    public init() {}

    public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1?.next != nil, l2?.next != nil {
            return addTwoNumbers(l1?.next, l2?.next)
        }
        if let l1Value = l1?.val, let l2Value = l2?.val {
            let sum = l1Value + l2Value
            return ListNode(sum % 10)
        }
        return ListNode(0)
    }
}
