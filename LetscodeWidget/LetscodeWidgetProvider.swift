//  LetscodeWidgetProvider.swift
//  LetscodeWidgetExtension
//
//  Created by Tiago Oliveira on 23/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import WidgetKit

struct LetscodeWidgetProvider: TimelineProvider {
    typealias Entry = LetscodeWidgetEntry

    func placeholder(in context: Context) -> LetscodeWidgetEntry {
        LetscodeWidgetEntry()
    }

    func getSnapshot(in context: Context, completion: @escaping (LetscodeWidgetEntry) -> Void) {
        completion(LetscodeWidgetEntry())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<LetscodeWidgetEntry>) -> Void) {
        completion(Timeline(entries: [LetscodeWidgetEntry()], policy: .never))
    }
}
