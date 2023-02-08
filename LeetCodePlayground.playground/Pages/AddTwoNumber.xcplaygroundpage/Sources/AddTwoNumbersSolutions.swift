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

    /// addTwoNumbers
    /// Essa solução usa dois ponteiros, p1 e p2, são usados para percorrer as duas listas encadeadas ao mesmo tempo. A variável carry armazena o valor de transporte (se houver).
    /// Enquanto houver pelo menos um elemento nas duas listas ou um valor de transporte, a soma é calculada e adicionada a uma nova lista encadeada.
    /// O resultado final é a lista encadeada representando a soma dos dois números.
    /// - Parameters:
    ///   - l1: ListNode 1
    ///   - l2: ListNode 2
    /// - Returns: Returns the encadeade list representing the sum of two numbers.
    public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy: ListNode? = ListNode(0)
        var cur = dummy
        var carry = 0
        var p1 = l1
        var p2 = l2

        while p1 != nil || p2 != nil || carry > 0 {
            if let n1 = p1 {
                carry += n1.val
                p1 = n1.next
            }

            if let n2 = p2 {
                carry += n2.val
                p2 = n2.next
            }

            cur?.next = ListNode(carry % 10)
            cur = cur?.next
            carry /= 10
        }

        return dummy?.next
    }
}

public extension ListNode {
    func resultNode() -> [Int] {
        var result = [Int]()
        result.append(val)
        var node = next
        while node != nil {
            result.append(node!.val)
            node = node!.next
        }
        return result
    }
}
