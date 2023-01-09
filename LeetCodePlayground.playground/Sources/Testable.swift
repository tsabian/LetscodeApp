import Foundation

public protocol Testable {
    func allProperties() -> [String: Any]
}

public extension Testable {
    func allProperties() -> [String: Any] {
        let mirror = Mirror(reflecting: self)
        var properties = [String: Any]()
        for (label, value) in mirror.children {
            guard let name = label else { continue }
            properties[name] = value
        }
        return properties
    }
}
