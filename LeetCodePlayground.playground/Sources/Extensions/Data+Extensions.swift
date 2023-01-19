import Foundation

extension Data {
    func hexFormat() -> String {
        map { String(format: "%02hhx", $0) }.joined(separator: "")
    }
}
