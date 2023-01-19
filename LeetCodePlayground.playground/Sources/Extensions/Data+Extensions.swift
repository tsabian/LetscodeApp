import Foundation

extension Data {
    func hexFormat(separator: String = "") -> String {
        map { String(format: "%02hhx", $0) }.joined(separator: separator)
    }
}
