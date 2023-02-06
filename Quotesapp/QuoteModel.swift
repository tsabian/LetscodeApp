//  QuoteModel.swift
//  Quotesapp
//
//  Created by Tiago Oliveira on 05/02/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

struct QuoteElement: Codable {
    let id = UUID()
    let quote, name: String

    enum CodingKeys: String, CodingKey {
        case quote, name
    }
}

typealias Quotes = [QuoteElement]

extension Quotes {
    static func load(from fileName: String) -> Quotes {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil), let data = try? Data(contentsOf: url) else {
            return Quotes()
        }
        var quotes = Quotes()
        do {
            quotes = try data.decoded()
        } catch {
            debugPrint(error)
        }
        return quotes
    }
}
