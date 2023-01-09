//: [Previous](@previous)

import Foundation

extension LosslessStringConvertible {
    var string: String { .init(self) }
}

extension FloatingPoint where Self: LosslessStringConvertible {
    var decimal: Decimal? { Decimal(string: string) }
}

let json = """
{
    "amount": 0.03999999999
}
"""

struct Dto: Codable {
    let amount: Decimal
}

guard let jsonData = json.data(using: .utf8) else {
    fatalError("Invalid Json")
}

var dto: Dto!

do {
    dto = try JSONDecoder().decode(Dto.self, from: jsonData)
} catch let err {
    debugPrint(err)
}

debugPrint(dto.amount)
