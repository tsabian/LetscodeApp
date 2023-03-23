//  DateTimeWidget.swift
//  LetscodeWidgetExtension
//
//  Created by Tiago Oliveira on 23/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI
import WidgetKit

struct DateTimeWidget: Widget {
    let kind = "DateTimeWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: DateTimeWidgetProvider()) { entry in
            DateTimeWidgetView(entry: entry)
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Today")
        .description("Widget shows today's date")
    }
}
