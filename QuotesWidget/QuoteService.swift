//  QuoteService.swift
//  QuotesWidgetExtension
//
//  Created by Tiago Oliveira on 23/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

enum QuoteServiceError: Error {
    case invalidURL
}

struct QuoteService {
    private let apiURLString = "https://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en"

    func fetch() async -> Result<QuoteModel, Error> {
        guard let url = URL(string: apiURLString) else {
            return .failure(QuoteServiceError.invalidURL)
        }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let quote = try JSONDecoder().decode(QuoteModel.self, from: data)
            return .success(quote)
        } catch {
            return .failure(error)
        }
    }
}
