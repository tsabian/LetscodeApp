//  RCPlistKeysModel.swift
//  Letscode
//
//  Created by Tiago Almeida de Oliveira on 24/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

struct RCPlistKeysModel: Codable {
    let salt, publicKey, initVector: String

    enum CodingKeys: String, CodingKey {
        case salt
        case initVector = "initvector"
        case publicKey = "publickey"
    }
}
