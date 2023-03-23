//  EnvironmentSetable.swift
//  NetworkManager
//
//  Created by Tiago Oliveira on 08/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

@propertyWrapper
struct EnvironmentSetable<Output> {
    var keyName: String

    var wrappedValue: Output {
        mutating get {
            guard let value = Bundle.main.infoDictionary?[keyName] as? Output else {
                fatalError("The variable \(keyName) can't be nil")
            }
            return value
        }
    }

    init(from keyName: String) {
        self.keyName = keyName
    }
}
