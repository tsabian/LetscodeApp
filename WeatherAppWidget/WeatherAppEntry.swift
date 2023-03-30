//  WeatherAppEntry.swift
//  WeatherAppWidgetExtension
//
//  Created by Tiago Oliveira on 25/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import WidgetKit

struct WeatherAppEntry: TimelineEntry {
    let date: Date
    let dataResult: WeatherResult
}
