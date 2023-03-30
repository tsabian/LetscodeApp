//  WeatherAppWidget.swift
//  WeatherAppWidget
//
//  Created by Tiago Almeida de Oliveira on 24/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI
import WidgetKit

struct WeatherAppWidget: Widget {
    let kind: String = "WeatherAppWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WeatherAppProvider()) { entry in
            WeatherEntryView(entry: entry)
        }
        .configurationDisplayName("Weather Widget")
        .description("This widget shows current weather.")
    }
}
