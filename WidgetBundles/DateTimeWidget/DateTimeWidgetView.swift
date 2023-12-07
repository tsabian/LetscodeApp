//  DateTimeWidgetView.swift
//  LetscodeWidgetExtension
//
//  Created by Tiago Oliveira on 23/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI
import WidgetKit

struct DateTimeWidgetView: View {
    let entry: DateTimeWidgetEntry

    private var day: String {
        getDate(format: "E")
    }

    private var month: String {
        getDate(format: "MMM")
    }

    private var date: String {
        getDate(format: "dd")
    }

    private var time: String {
        getDate(format: "hh:mm")
    }

    var body: some View {
        ZStack {
            VStack(spacing: 5) {
                Text(month)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, maxHeight: 30)
                    .background(Rectangle().fill(.red))

                Text(day)
                Text(date)
                    .font(.largeTitle)
                Text(time)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(color: .gray, radius: 5, x: 5, y: 5))
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
    }

    private func getDate(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: entry.date)
    }
}

struct DateTimeWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        DateTimeWidgetView(entry: DateTimeWidgetEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
