import Foundation

public extension String {
    /// Matches from regex pattern.
    /// - Parameter regex: The Regex pattern.
    /// - Returns: return the count of elements match with regex pattern.
    func matches(for regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self, range: NSRange(startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch {
            debugPrint("invalid regex: \(error.localizedDescription)")
            return []
        }
    }

    /// Replace a string using a Regex pattern.
    /// - Parameters:
    /// - pattern: Set the Regex Pattern.
    /// - template: Define the template that will replace the pattern.
    /// - Returns: Returns a new string with the template.
    func stringByReplacingRegexMathes(pattern: String, with template: String) -> String? {
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let range = NSRange(location: 0, length: count)
            let newString = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: template)
            return newString
        } catch {
            debugPrint(error.localizedDescription)
            return nil
        }
    }

    func format(_ obj: Any) -> String {
        let str = String(format: self, arguments: [String(describing: obj)])
        return str
    }

    var isEmailValid: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }

    func obfuscateEmail(maskChar: String = "•", obfuscateDns: Bool = true) -> String {
        let split = split(separator: "@")

        guard isEmailValid, split.count == 2, let dotIndex = split[1].lastIndex(of: Character(".")) else {
            return maskChar
        }

        var mask = String(first ?? " ")
        if split[0].count > 1 {
            let limit = obfuscateDns ? 1 : 2
            mask.append(String(repeating: maskChar, count: split[0].count - limit))
            if !obfuscateDns {
                mask.append(String(split[0].last ?? " "))
            }
        }
        mask.append("@")

        if obfuscateDns {
            let secondPart = split[1]
            let domain = secondPart[..<dotIndex]
            mask.append(domain.first!)
            mask.append(String(repeating: maskChar, count: domain.count - 1))
            mask.append(String(secondPart[dotIndex...]))
        } else {
            mask.append(String(split[1]))
        }

        return mask
    }

    var convertFromHexString: String {
        if let hexData = Data(hexString: self), let text = String(data: hexData, encoding: .utf8) {
            return text.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return ""
    }
}
