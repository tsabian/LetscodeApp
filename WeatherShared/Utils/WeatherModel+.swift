//
//  WeatherModel+.swift
//  Weatherapp
//
//  Created by Tiago Almeida de Oliveira on 24/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

extension Condition {
    var iconValue: String {
        let current = text.lowercased()
        switch current {
        case _ where current.contains("Partly cloudy"):
            return "🌤️"

        case _ where current.contains("light rain"):
            return "☔️"

        case _ where current.contains("Heavy rain"):
            return "⛈️"

        case _ where current.contains("cloudy"):
            return "☁️"

        case _ where current.contains("drizzle"):
            return "🌧️"

        case _ where current.contains("sunny"):
            return "☀️"

        case _ where current.contains("clear"):
            return "🌕"

        case _ where current.contains("Fog"):
            return "🌫️"

        default:
            return "🌥️"
        }
    }
}
