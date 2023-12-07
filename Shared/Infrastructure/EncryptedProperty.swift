//  EncryptedProperty.swift
//  Letscode
//
//  Created by Tiago Almeida de Oliveira on 24/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

@propertyWrapper
struct EncryptedProperty: DiagnosticsProtocol {
    private let encryptEngine: CryptoUtilsAES256Protocol?
    private var base64EncodedValue: String?

    var wrappedValue: String {
        get {
            decrypted ?? (base64EncodedValue ?? "")
        }
        set {
            base64EncodedValue = newValue
        }
    }

    init(wrappedValue: String, encryptionChain: RCPlistKeysModel) {
        do {
            encryptEngine = try CryptoUtilsAES256(
                key: encryptionChain.publicKey,
                iv: encryptionChain.initVector
            )
        } catch {
            encryptEngine = nil
            logDiagnostic(
                code: 1,
                userInfo: [
                    "EncryptedProperty": "It can't initialize without encript enginee starts",
                    "error": error,
                ]
            )
        }
        self.wrappedValue = wrappedValue
    }

    private var decrypted: String? {
        guard let encryptedValue = base64EncodedValue, let engine = encryptEngine else {
            logDiagnostic(
                code: 2,
                userInfo: [
                    "EncryptedProperty": "It can't decrypt without encript enginee starts",
                ]
            )
            return nil
        }
        do {
            return try engine.decrypt(cipher: encryptedValue)
        } catch {
            logDiagnostic(
                code: 3,
                userInfo: [
                    "EncryptedProperty": "It can't decrypt wrappedValye",
                    "error": error,
                ]
            )
            return nil
        }
    }
}
