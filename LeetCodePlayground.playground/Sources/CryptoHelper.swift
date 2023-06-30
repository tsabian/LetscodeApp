import CommonCrypto
import Foundation

public protocol CryptoHelperProtocol {
    func sha256(plainText text: String) -> String?
    func sha256(binaryData: Data) -> String?
    @available(*, deprecated, message: "This method is deprecated. Use the sha256(plainText text: String) instead.")
    func md5(plainText string: String) -> String
}

public class CryptoHelper: CryptoHelperProtocol {
    private let hexadecimalFormat = "%02x"

    public init() {}

    private func hashSha256(data: Data) -> Data {
        var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes { _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &hash) }
        return Data(hash)
    }

    private func convertCypherOnHexFormat(data: Data) -> String {
        var cypherText = ""
        for byte in data {
            cypherText += String(format: hexadecimalFormat, UInt8(byte))
        }
        return cypherText
    }

    @available(*, deprecated, message: "This method is deprecated. Use the sha256(plainText text: String) instead.")
    public func md5(plainText string: String) -> String {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using: .utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData.hexFormat()
    }

    public func sha256(plainText text: String) -> String? {
        guard !text.isEmpty, let data = text.data(using: .utf8) else {
            return nil
        }
        let cypher = hashSha256(data: data)
        return convertCypherOnHexFormat(data: cypher)
    }

    public func sha256(binaryData data: Data) -> String? {
        if data.isEmpty {
            return nil
        }
        let cypher = hashSha256(data: data)
        return convertCypherOnHexFormat(data: cypher)
    }
}
