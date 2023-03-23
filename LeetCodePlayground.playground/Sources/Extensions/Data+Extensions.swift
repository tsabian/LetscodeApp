import Foundation

public extension Data {
    /// Initialize a new instance of data converting a hex string to object data
    /// - Parameter hexString: hexString
    init?(hexString: String) {
        let hexStringLength = hexString.count
        let dataLength = hexStringLength / 2
        var data = Data(capacity: dataLength)
        for index in 0..<dataLength {
            let startIndex = hexString.index(hexString.startIndex, offsetBy: index * 2)
            let endIndex = hexString.index(startIndex, offsetBy: 2)
            let hexBytes = hexString[startIndex..<endIndex]
            var decimalValue: UInt8 = 0
            if let decimalValueFromHex = UInt8(hexBytes, radix: 16) {
                decimalValue = decimalValueFromHex
            } else {
                return nil
            }
            let decimalValueSize = 1
            data.append(&decimalValue, count: decimalValueSize)
        }
        self = data
    }

    var stringFromHex: String {
        let hexString = map { String(format: "%02x", $0) }.joined()
        if let hexData = Data(hexString: hexString), let text = String(data: hexData, encoding: .utf8) {
            return text.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return ""
    }

    func hexFormat(separator: String = "") -> String {
        map { String(format: "%02hhx", $0) }.joined(separator: separator)
    }
}
