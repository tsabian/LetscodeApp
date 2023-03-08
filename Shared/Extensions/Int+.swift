//  Int+.swift
//  ListPart1
//
//  Created by Tiago Oliveira on 08/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

extension Int {
    func formatted(locale identifier: String = "pt_BR") -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: identifier)
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
