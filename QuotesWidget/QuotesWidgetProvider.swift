//  QuotesWidgetProvider.swift
//  QuotesWidgetExtension
//
//  Created by Tiago Oliveira on 23/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import WidgetKit

struct QuotesWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> QuotesWidgetEntry {
        QuotesWidgetEntry(date: Date(), quote: QuoteModel.defaultQuote())
    }

    func getSnapshot(in context: Context, completion: @escaping (QuotesWidgetEntry) -> Void) {
        completion(QuotesWidgetEntry(date: Date(), quote: QuoteModel.defaultQuote()))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<QuotesWidgetEntry>) -> Void) {
        Task(priority: .background) {
            let fetchResult = await QuoteService().fetch()
            var entries = [QuotesWidgetEntry]()

            switch fetchResult {
            case .success(let newRandomQuote):
                entries.append(QuotesWidgetEntry(date: Date(), quote: newRandomQuote))

            case .failure(let error):
                let quoteError = QuoteModel(quoteText: "\(error.localizedDescription)", quoteAuthor: "", senderName: "", senderLink: "", quoteLink: "")
                let quoteEntry = QuotesWidgetEntry(date: Date(), quote: quoteError)
                entries.append(quoteEntry)
            }

            let afterDate = Calendar.current.date(byAdding: .minute, value: 1, to: Date()) ?? Date()
            completion(Timeline(entries: entries, policy: .after(afterDate)))
        }
    }
}
