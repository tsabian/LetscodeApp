//: [Previous](@previous)

import Foundation

var amount = "96.08"

var amountFormatted: String? {
    guard var amountDouble = Double(amount) as? NSNumber else {
        return nil
    }
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "pt_BR")
    formatter.decimalSeparator = ","
    formatter.numberStyle = .currencyPlural
    let value = formatter.string(from: amountDouble)
    return value
}

print(amountFormatted)


