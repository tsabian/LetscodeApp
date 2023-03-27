//  WeatherAppProvider.swift
//  WeatherAppWidgetExtension
//
//  Created by Tiago Oliveira on 25/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import WidgetKit

struct WeatherAppProvider: TimelineProvider {
    private let weatherDefault = WeatherMock.shared.patchyRainPossible()
    private let errorDescriptionDefault = "Houve um erro ao tentar carregar os dados!"
    private let repository = WeatherRepository()
    private var lat: Double = -23.464515
    private var lon: Double = -45.052483

    func placeholder(in context: Context) -> WeatherAppEntry {
        WeatherAppEntry(date: Date(), weather: WeatherResult(weather: weatherDefault, errorDescription: nil))
    }

    func getSnapshot(in context: Context, completion: @escaping (WeatherAppEntry) -> Void) {
        completion(Entry(date: Date(), weather: WeatherResult(weather: weatherDefault, errorDescription: nil)))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherAppEntry>) -> Void) {
        Task {
            let now = Date()
            let currentWeather = await repository.fetchCurrent(latitude: lat, longitude: lon)
            guard let refreshDate = Calendar.current.date(byAdding: .minute, value: 15, to: now), let weather = currentWeather else {
                let entry = WeatherAppEntry(date: now, weather: WeatherResult(weather: nil, errorDescription: errorDescriptionDefault))
                completion(Timeline(entries: [entry], policy: .never))
                return
            }
            let entry: WeatherAppEntry!
            entry = WeatherAppEntry(date: now, weather: WeatherResult(weather: weather, errorDescription: nil))
            completion(Timeline(entries: [entry], policy: .after(refreshDate)))
        }
    }
}
