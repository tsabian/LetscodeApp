//  Mockable.swift
//  Letscode
//
//  Created by Tiago Oliveira on 14/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

protocol Mockable {
    func load<Output: Codable>(from bundle: Bundle, on jsonFileName: String) -> Output
}

extension Mockable {
    func load<Output: Codable>(from bundle: Bundle, on jsonFileName: String) -> Output {
        guard let pathURL = bundle.url(forResource: jsonFileName, withExtension: "json") else {
            fatalError("Path URL not found.")
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            let data = try Data(contentsOf: pathURL)
            return try decoder.decode(Output.self, from: data)
        } catch {
            debugPrint(error)
            fatalError(error.localizedDescription.description)
        }
    }
}
