//  WeatherMock.swift
//  Weatherapp
//
//  Created by Tiago Oliveira on 25/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

struct WeatherMock: Mockable {
    static let shared = WeatherMock()
    private init() {}

    func patchyRainPossible() -> WeatherModel {
        load(from: .main, on: "patchy-rain-possible")
    }

    func mist() -> WeatherModel {
        load(from: .main, on: "mist")
    }

    func sunny() -> WeatherModel {
        load(from: .main, on: "sunny")
    }

    func forecastSunny() -> WeatherModel {
        load(from: .main, on: "forecast-sunny")
    }

    func forecastPartialCloudy() -> WeatherModel {
        load(from: .main, on: "forecast-partial-cloudy")
    }

    func forecastFog() -> WeatherModel {
        load(from: .main, on: "forecast-fog")
    }

    func forecastClear() -> WeatherModel {
        load(from: .main, on: "forecast-clear")
    }

    func forecastModerateHeavyRain() -> WeatherModel {
        load(from: .main, on: "forecast-moderate-heavy-rain")
    }

    func forecastRainPossible() -> WeatherModel {
        load(from: .main, on: "forecast-rain-possible")
    }

    func forecastOvercast() -> WeatherModel {
        load(from: .main, on: "forecast-overcast")
    }
}
