import Foundation

public typealias FindElement<Index, Element> = (index: Index, element: Element)

public extension Array {
    subscript(safe index: Index) -> Element? {
        index >= 0 && index < count ? self[index] : nil
    }

    func next(from index: Index) -> FindElement<Index, Element>? {
        let i = index + 1
        guard let element = self[safe: i] else {
            return nil
        }
        return (i, element)
    }

    func previous(from index: Index) -> FindElement<Index, Element>? {
        let i = index - 1
        guard let element = self[safe: i] else {
            return nil
        }
        return (i, element)
    }
}
