import Foundation

public extension String {
    func toRawNumber() -> NSNumber? {
        do {
            var amountWithPrefix = self
            let regex = try NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
            amountWithPrefix = regex.stringByReplacingMatches(
                in: amountWithPrefix,
                options: NSRegularExpression.MatchingOptions(rawValue: 0),
                range: NSRange(location: 0, length: count),
                withTemplate: ""
            )
            if let double = Double(amountWithPrefix) {
                let number = NSNumber(value: double / 100)

                guard number != 0 as NSNumber else {
                    return nil
                }
                return number
            }
            return nil
        } catch {
            return nil
        }
    }
}
