//  QuoteModel.swift
//  QuotesWidgetExtension
//
//  Created by Tiago Oliveira on 23/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

struct QuoteModel: Codable {
    let quoteText, quoteAuthor, senderName, senderLink: String
    let quoteLink: String
}

extension QuoteModel {
    static func defaultQuote() -> QuoteModel {
        QuoteModel(
            quoteText: "Until you make peace with who you are, you\'ll never be content with what you have.",
            quoteAuthor: "Doris Mortman",
            senderName: "",
            senderLink: "",
            quoteLink: "http://forismatic.com/en/c3f4f9bc89/"
        )
    }
}
