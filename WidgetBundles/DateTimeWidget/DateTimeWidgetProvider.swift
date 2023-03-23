//  DateTimeWidgetProvider.swift
//  LetscodeWidgetExtension
//
//  Created by Tiago Oliveira on 23/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import WidgetKit

struct DateTimeWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> DateTimeWidgetEntry {
        DateTimeWidgetEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (DateTimeWidgetEntry) -> Void) {
        completion(DateTimeWidgetEntry(date: Date()))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<DateTimeWidgetEntry>) -> Void) {
        var entries = [DateTimeWidgetEntry]()
        let now = Date()
        for minuteOffset in 1...10 {
            if let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: now) {
                let newEntry = DateTimeWidgetEntry(date: entryDate)
                entries.append(newEntry)
            }
        }
        // .atEnd: as entradas de dados fornecidas serão exibidas no widget até que a última entrada de dados seja exibida.
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
