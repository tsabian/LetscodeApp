//  Double+.swift
//  Quakes
//
//  Created by Tiago Oliveira on 12/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

extension Double {
    func toDecimalFormatted() -> String {
        let numberFormat = NumberFormatter()
        numberFormat.locale = Locale.current
        numberFormat.numberStyle = .decimal
        numberFormat.generatesDecimalNumbers = true
        numberFormat.maximumFractionDigits = 2
        numberFormat.minimumFractionDigits = 2
        return numberFormat.string(from: self as NSNumber) ?? ""
    }
}
