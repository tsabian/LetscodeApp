//  CryptoUtilsAES256Protocol.swift
//  Letscode
//
//  Created by Tiago Almeida de Oliveira on 24/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//  source: https://opensource.apple.com/source/CommonCrypto/CommonCrypto-36064/CommonCrypto/CommonCryptor.h
//

import CommonCrypto
import CryptoKit
import SwiftUI

protocol CryptoUtilsAES256Protocol {
    /// Encrypts plain text using AES256 algoritim
    /// - Parameter text: Plain text
    /// - Returns: Return cipher text with base64 formatation.
    func encrypt(plain text: String) throws -> String?

    /// Decrypts base64Text using AES256 algoritim
    /// - Parameter Base64Text: Base64 value encrypted
    /// - Returns: Return plain text decrypted.
    func decrypt(cipher Base64Text: String) throws -> String?

    /// Encrypts value using AES256 algoritim.
    /// - Parameter value: Value to encrypt.
    /// - Returns: Return cipher text with base64 formatation.
    func encrypt<T>(value: T) throws -> String?

    /// Decrypts base64Text using AES256 algoritim
    /// - Parameter Base64Text: Base64 value encrypted
    /// - Returns: Return plain value decrypted.
    func decrypt<T>(cipher base64Text: String) throws -> T?
}

class CryptoUtilsAES256: CryptoUtilsAES256Protocol {
    /// AES-256 Error
    enum AES256Error: Swift.Error {
        /// When key size be invalid or not equals to 32 Bits size.
        case invalidKeySize
        /// When IV size be invalid or not equals to 16 Bits size.
        case invalidInputVectorSize
        /// Converts string to data failed.
        case convertStringToDataFailed
        case cryptoFailed(status: CCCryptorStatus)
        case keyGeneratorFailed(status: Int32)
    }

    private enum AES256OperationType {
        case encrypt
        case decrypt

        var index: UInt32 {
            switch self {
            case .encrypt: return UInt32(kCCEncrypt)
            case .decrypt: return UInt32(kCCDecrypt)
            }
        }
    }

    private let options: CCOptions = UInt32(kCCOptionPKCS7Padding)
    private let algorithm: CCAlgorithm = UInt32(kCCAlgorithmAES128)
    private let keySize = size_t(kCCKeySizeAES256)
    private let blockSize = size_t(kCCBlockSizeAES128)

    /** ivData
        Note: Can be generate with `openssl rand -hex 16` on macOS terminal.
     */
    private let ivData: Data

    /**
     keyData
     Note: Can be generate with `openssl rand -hex 32` on macOS temrinal.
     */
    private let keyData: Data

    /// Initialize a new instance of CryptoUtilsAES256.
    /// - Parameters:
    ///   - key: Key of 32 Bits
    ///   - iv: initial vector data.
    init(key: String, iv: String) throws {
        guard let ivData = iv.data(using: .utf8), let keyData = key.data(using: .utf8) else {
            throw AES256Error.convertStringToDataFailed
        }
        if keyData.count != keySize {
            throw AES256Error.invalidKeySize
        }
        if ivData.count != blockSize {
            throw AES256Error.invalidInputVectorSize
        }
        self.ivData = ivData
        self.keyData = keyData
    }

    func encrypt(plain text: String) throws -> String? {
        guard let input = text.data(using: .utf8) else {
            throw AES256Error.convertStringToDataFailed
        }
        let data = try crypt(input: input, operation: .encrypt)
        return data.base64EncodedString()
    }

    func decrypt(cipher base64Text: String) throws -> String? {
        guard let input = Data(base64Encoded: base64Text) else {
            throw AES256Error.convertStringToDataFailed
        }
        let data = try crypt(input: input, operation: .decrypt)
        return String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func encrypt<T>(value: T) throws -> String? {
        var value = value
        let valueData = Data(bytes: &value, count: MemoryLayout<T>.size)
        let data = try crypt(input: valueData, operation: .encrypt)
        return data.base64EncodedString()
    }

    func decrypt<T>(cipher base64Text: String) throws -> T? {
        guard let input = Data(base64Encoded: base64Text) else {
            throw AES256Error.convertStringToDataFailed
        }
        let data = try crypt(input: input, operation: .decrypt)
        var value: T?
        data.withUnsafeBytes { pointer in
            value = pointer.load(as: T.self)
        }
        return value
    }

    /// Encrypt or Decrypt data using AES-256-CBC alghoritm.
    /// - Parameters:
    ///   - input: Input data to encryo or decrypt
    ///   - operation: Operation, if encrypt or decrypt data.
    /// - Returns: returns encrypted or decrypted data.
    private func crypt(input: Data, operation: AES256OperationType) throws -> Data {
        var outLenght = Int.zero
        var outBytes = [UInt32](repeating: 0, count: input.count + kCCBlockSizeAES128)
        var status = CCCryptorStatus(kCCSuccess)

        input.withUnsafeBytes { inputBytes in
            ivData.withUnsafeBytes { ivDataBytes in
                keyData.withUnsafeBytes { keyDataByes in
                    status = CCCrypt(
                        operation.index,
                        algorithm,
                        options,
                        keyDataByes.baseAddress,
                        keySize,
                        ivDataBytes.baseAddress,
                        inputBytes.baseAddress,
                        input.count,
                        &outBytes,
                        outBytes.count,
                        &outLenght
                    )
                }
            }
        }

        guard status == kCCSuccess else {
            throw AES256Error.cryptoFailed(status: status)
        }

        return Data(bytes: &outBytes, count: outLenght)
    }

    /// Create AES-256 Key
    /// - Parameters:
    ///   - secret: Secret string for AES-256 Key, should be 32 Bits max lenght.
    ///   - salt: Salt string for AES-256 Key.
    /// - Returns: returns AES-256-CGC key for encrypt data.
    static func createKey(secret: String, salt: String) throws -> Data {
        guard let secretData = secret.data(using: .utf8), let saltData = salt.data(using: .utf8) else {
            throw AES256Error.convertStringToDataFailed
        }

        if secretData.count > size_t(kCCKeySizeAES256) {
            throw AES256Error.invalidKeySize
        }

        let lenght = kCCKeySizeAES256
        var status = Int32.zero
        var derivedBytes = [UInt8](repeating: 0, count: lenght)
        let kCreateKeyRounds = UInt32(10_000)

        secretData.withUnsafeBytes { rawPointer in
            let passwordRaw = rawPointer.baseAddress!
            let passwordBytes = passwordRaw.assumingMemoryBound(to: Int8.self)

            saltData.withUnsafeBytes { rawPointer in
                let saltRaw = rawPointer.baseAddress!
                let saltBytes = saltRaw.assumingMemoryBound(to: UInt8.self)

                status = CCKeyDerivationPBKDF(
                    CCPBKDFAlgorithm(kCCPBKDF2),
                    passwordBytes,
                    secret.count,
                    saltBytes,
                    saltData.count,
                    CCPseudoRandomAlgorithm(kCCPRFHmacAlgSHA1),
                    kCreateKeyRounds,
                    &derivedBytes,
                    lenght
                )
            }
        }

        guard status == 0 else {
            throw AES256Error.keyGeneratorFailed(status: status)
        }
        return Data(bytes: &derivedBytes, count: lenght)
    }
}
