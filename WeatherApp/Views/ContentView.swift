//  ContentView.swift
//  Weatherapp
//
//  Created by Tiago Almeida de Oliveira on 24/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import CoreLocation
import SwiftUI

struct ContentView: View {
    private var repository = WeatherRepository()
    @State private var weather: WeatherModel?
    @ObservedObject var locationManager = LocationManager()

    var body: some View {
        VStack {
            if let weather {
                CurrentCard(location: weather.location, current: weather.current)
            } else {
                EmptyView()
            }
            Spacer()
        }
        .onReceive(locationManager.$location, perform: { location in
            guard let location else {
                return
            }
            loadWeather(location.coordinate.latitude, location.coordinate.longitude)
        })
    }

    private func loadWeather(_ lat: Double, _ lon: Double) {
        Task {
            let model = await repository.fetchForecast(latitude: lat, longitude: lon)
            if let forecast = model {
                weather = forecast
            }
        }
    }
}

// MARK: - PreviewProvider

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
