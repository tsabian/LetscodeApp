//  Data+.swift
//  Quotesapp
//
//  Created by Tiago Oliveira on 05/02/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

public extension Data {
    func decoded<T: Decodable>() throws -> T {
        try JSONDecoder().decode(T.self, from: self)
    }
}
