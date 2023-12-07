//  WeatherModel+.swift
//  Weatherapp
//
//  Created by Tiago Almeida de Oliveira on 24/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

// MARK: - WeatherModel

extension WeatherModel {
    var todayForecast: Forecastday? {
        guard let forecast, !forecast.forecastday.isEmpty else {
            return nil
        }
        if let forecastDay = forecast.forecastday.first(where: { $0.date == Date().format(with: "yyyy-MM-dd") }) {
            return forecastDay
        }
        return nil
    }

    var forecastHours: [Hour] {
        guard let todayForecast else {
            return []
        }
        var hourAdding = DateComponents()
        hourAdding.hour = 14
        let now = Calendar.current.date(byAdding: hourAdding, to: Date()) ?? Date()
        let timeEpoch = Int(now.timeIntervalSince1970)
        let filteredHours = todayForecast.hour.filter { $0.timeEpoch >= timeEpoch }
        return filteredHours
    }
}
