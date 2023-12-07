//  WeatherAppProvider.swift
//  WeatherAppWidgetExtension
//
//  Created by Tiago Oliveira on 25/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import CoreLocation
import WidgetKit

class WeatherAppProvider: NSObject, TimelineProvider {
    private let weatherDefault = WeatherMock.shared.patchyRainPossible()
    private let errorDescriptionDefault = "Houve um erro ao tentar carregar os dados!"
    private let repository = WeatherRepository()
    private var lat = -23.46
    private var lon = -45.05

    override init() {
        super.init()
    }

    func placeholder(in context: Context) -> WeatherAppEntry {
        WeatherAppEntry(date: Date(), dataResult: WeatherResult(weather: weatherDefault, errorDescription: nil))
    }

    func getSnapshot(in context: Context, completion: @escaping (WeatherAppEntry) -> Void) {
        completion(Entry(date: Date(), dataResult: WeatherResult(weather: weatherDefault, errorDescription: nil)))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherAppEntry>) -> Void) {
        Task {
            debugPrint(#function)
            let now = Date()
            let currentWeather = await repository.fetchCurrent(latitude: lat, longitude: lon)
            guard let refreshDate = Calendar.current.date(byAdding: .minute, value: 15, to: now), let weather = currentWeather else {
                let entry = WeatherAppEntry(date: now, dataResult: WeatherResult(weather: nil, errorDescription: errorDescriptionDefault))
                completion(Timeline(entries: [entry], policy: .never))
                return
            }
            let entry = WeatherAppEntry(date: now, dataResult: WeatherResult(weather: weather, errorDescription: nil))
            completion(Timeline(entries: [entry], policy: .after(refreshDate)))
        }
    }
}
