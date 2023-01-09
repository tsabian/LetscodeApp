import Foundation

extension Data {
    
    func hexFormat() -> String {
        return self.map { String(format: "%02hhx", $0) }.joined(separator: "")
    }
    
}
