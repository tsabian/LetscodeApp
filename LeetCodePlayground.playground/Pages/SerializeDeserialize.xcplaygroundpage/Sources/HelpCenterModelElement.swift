// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let helpCenterModel = try HelpCenterModel(json)

import Foundation

// MARK: - HelpCenterModelElement

public struct HelpCenterModelElement: Codable {
    public let name: String
    public let label: String

    enum CodingKeys: String, CodingKey {
        case name
        case label
    }
}

public typealias HelpCenterModel = [HelpCenterModelElement]

// MARK: HelpCenterModelElement convenience initializers and mutators

public extension HelpCenterModelElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(HelpCenterModelElement.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: Data(contentsOf: url))
    }

    func with(
        name: String? = nil,
        label: String? = nil
    ) -> HelpCenterModelElement {
        HelpCenterModelElement(
            name: name ?? self.name,
            label: label ?? self.label
        )
    }

    func jsonData() throws -> Data {
        try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        try String(data: jsonData(), encoding: encoding)
    }
}

public extension [HelpCenterModel.Element] {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(HelpCenterModel.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        try String(data: jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

public func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

public func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
