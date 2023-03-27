//  EnvironmentSetable.swift
//  NetworkManager
//
//  Created by Tiago Oliveira on 08/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

// MARK: - EnvironmentSetableProtocol

protocol EnvironmentSetableProtocol {
    associatedtype Value
    var keyName: String { get }
    var wrappedValue: Value { mutating get }

    init(from keyName: String)
}

extension EnvironmentSetableProtocol {
    func getEnvironmentFromBundle() -> Value {
        guard let value = Bundle.main.infoDictionary?[keyName] as? Value else {
            fatalError("The variable \(keyName) can't be nil")
        }
        return value
    }
}

// MARK: - EnvironmentSetable

@propertyWrapper
struct EnvironmentSetable: EnvironmentSetableProtocol {
    var keyName: String

    var wrappedValue: String {
        mutating get {
            getEnvironmentFromBundle()
        }
    }

    init(from keyName: String) {
        self.keyName = keyName
    }
}

// MARK: - EnvironmentEncryptedSetable

@propertyWrapper
struct EnvironmentEncryptedSetable: EnvironmentSetableProtocol {
    var keyName: String

    @EncryptedProperty(encryptionChain: RCPlistKeysModel(salt: AppConstants.salt, publicKey: AppConstants.key, initVector: AppConstants.iv))
    private(set) var wrappedValue: String = ""

    init(from keyName: String) {
        self.keyName = keyName
        wrappedValue = getEnvironmentFromBundle()
    }
}
