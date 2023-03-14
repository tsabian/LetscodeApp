//  Int+.swift
//  ListPart1
//
//  Created by Tiago Oliveira on 08/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

extension Int {
    func toDecimalFormatted() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale.current
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }

    func toDateFormatted(format: String = "EEEE, MMM, d, yyyy - hh:mm") -> String {
        let unixTimestamp = Double(self / 1000)
        let date = Date(timeIntervalSince1970: unixTimestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
