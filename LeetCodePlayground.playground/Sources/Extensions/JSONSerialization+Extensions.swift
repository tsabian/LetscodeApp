import Foundation

public extension JSONSerialization {
    static func sanitizeJSONObject(_ jsonObject: [String: Any]) -> [String: Any] {
        var sanitizedObject: [String: Any] = [:]
        for (key, value) in jsonObject {
            if let stringValue = value as? String {
                let sanitizedValue = sanitizeString(stringValue)
                sanitizedObject[key] = sanitizedValue
            } else if let nestedObject = value as? [String: Any] {
                let sanitizedNestedObject = sanitizeJSONObject(nestedObject)
                sanitizedObject[key] = sanitizedNestedObject
            } else {
                sanitizedObject[key] = value
            }
        }
        return sanitizedObject
    }

    private static func sanitizeString(_ string: String) -> String {
        let allowedCharacterSet = CharacterSet.alphanumerics
        let sanitizedString = string.components(separatedBy: allowedCharacterSet.inverted).joined()
        return sanitizedString
    }
}
