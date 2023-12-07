//  QuotesWidgetView.swift
//  QuotesWidgetExtension
//
//  Created by Tiago Oliveira on 23/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI
import WidgetKit

struct QuotesWidgetView: View {
    let entry: QuotesWidgetEntry

    var body: some View {
        VStack(alignment: .center) {
            Text(entry.quote.quoteText)
            HStack {
                Spacer()
                Text("- \(entry.quote.quoteAuthor)")
            }
            .font(.caption)
            .foregroundColor(.secondary)

            Text(entry.date.formatted(date: .omitted, time: .shortened))
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(10)
    }
}

struct QuotesWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesWidgetView(entry: QuotesWidgetEntry(date: Date(), quote: QuoteModel.defaultQuote()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
