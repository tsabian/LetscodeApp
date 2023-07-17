import Foundation

let jsonString = """
{
    "Name": "Tiago",
    "age": 43,
    "attributes": {
        "endereco": "Rua xpto",
        "numero": 1
    }
}
"""
JSONSerialization.isValidJSONObject(jsonString)
let jsonStringData = jsonString.data(using: .utf8) ?? Data()
JSONSerialization.isValidJSONObject(jsonStringData)
let jsonStringDataBase64 = jsonStringData.base64EncodedString()
JSONSerialization.isValidJSONObject(jsonStringDataBase64)
let jsonData = Data(base64Encoded: jsonStringDataBase64, options: Data.Base64DecodingOptions.ignoreUnknownCharacters) ?? Data()
JSONSerialization.isValidJSONObject(jsonData)
let jsonAgain = String(data: jsonData, encoding: .utf8) ?? ""
JSONSerialization.isValidJSONObject(jsonAgain)
let jsonDict = try? JSONSerialization.jsonObject(with: jsonData)
JSONSerialization.isValidJSONObject(jsonDict)

typealias DictionaryItem = [String: Any]

struct PersonModel: Codable {
    let name: String
    var lastName: String?
    let age: Int
    var description: String?
    let attributes: DictionaryItem?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case lastName, age, description, attributes
    }

    init(name: String, lastName: String, age: Int, description: String, attributes: DictionaryItem) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.description = description
        self.attributes = attributes
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
        age = try container.decode(Int.self, forKey: .age)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        attributes = [:]
        // attributes = try container.decodeIfPresent(DictionaryItem.self, forKey: .attributes) ?? [:]
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(age, forKey: .age)
        try container.encode(description, forKey: .description)
        // try container.encode(attributes, forKey: .attributes)
    }
}

guard let jsonData = jsonString.data(using: .utf8) else {
    fatalError("Invalid Json")
}

print(PersonModel.CodingKeys.name.stringValue)
print(PersonModel.CodingKeys.name.rawValue)
print(PersonModel.CodingKeys.age.stringValue)

do {
    let person = try JSONDecoder().decode(PersonModel.self, from: jsonData)
    print(person.name)
    print(person.lastName ?? "")
    print(person.age)
    print(person.description ?? "")
    print(person.attributes ?? [:])
} catch {
    print(error)
}

let dictionary: [String: Any] = ["Name": "Alex", "age": 4, "attributes": ["endereco": "rua xpto"]]
if JSONSerialization.isValidJSONObject(dictionary), let data = try? JSONSerialization.data(withJSONObject: dictionary) {
    print(data.base64EncodedString())
    print(String(data: data, encoding: .utf8) ?? "")
    if let person = try? JSONDecoder().decode(PersonModel.self, from: data) {
        print(person.name)
        print(person.lastName ?? "")
        print(person.age)
        print(person.description ?? "")
        print(person.attributes ?? [:])
    }
}
