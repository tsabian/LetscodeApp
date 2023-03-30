//  WeatherWidgetView.swift
//  WeatherAppWidgetExtension
//
//  Created by Tiago Almeida de Oliveira on 27/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI
import WidgetKit

struct WeatherWidgetView: View {
    var weather: WeatherModel?

    var body: some View {
        VStack(alignment: .leading) {
            if let weather {
                Text(weather.location.name)
                Text(weather.current.tempC.toCelcius())
                    .font(.largeTitle)
                WebImage(from: "https:\(weather.current.condition.icon)")
                Text(weather.current.condition.text)
                    .font(.footnote)
                HStack {
                    Spacer()
                    Text("Update: \(Date().timeFormatted())")
                        .font(.system(size: 9))
                        .foregroundColor(.gray)
                }
            } else {
                Text("Houve um problema!!")
                    .font(.title3)
            }
        }
        .padding()
    }
}

struct DailyWeatherView: View {
    let forecastHour: Hour?

    private var time: String {
        guard let forecastHour else {
            return Date().format(with: "hh a")
        }
        let timeEpoch = TimeInterval(forecastHour.timeEpoch)
        return Date(timeIntervalSince1970: timeEpoch).format(with: "hh a")
    }

    var body: some View {
        if let forecastHour {
            VStack(alignment: .leading) {
                Text(time)
                Text("\(forecastHour.tempC.toCelcius())")
                WebImage(from: "https:\(forecastHour.condition.icon)")
                    .frame(maxWidth: 16, maxHeight: 16)
                    .padding(10)
            }
            .padding()
        } else {
            EmptyView()
        }
    }
}

struct AvarageWeatherView: View {
    let weather: WeatherModel?

    var lastUpdated: Date {
        guard let weather else { return Date() }
        let timeEpoch = TimeInterval(weather.current.lastUpdatedEpoch)
        return Date(timeIntervalSince1970: timeEpoch)
    }

    var body: some View {
        VStack(alignment: .leading) {
            if let weather, let todayForecast = weather.todayForecast {
                HStack(alignment: .bottom, spacing: 2) {
                    Text(weather.location.name)
                }
                Text(todayForecast.day.avgtempC.toCelcius())
                    .font(.largeTitle)
                WebImage(from: "https:\(todayForecast.day.condition.icon)")
                Text(todayForecast.day.condition.text)
                    .font(.footnote)
                HStack {
                    Spacer()
                    Text("Update: \(lastUpdated.timeFormatted())")
                        .font(.system(size: 9))
                        .foregroundColor(.gray)
                }
            } else {
                HStack {
                    Spacer()
                }
                Text("Houve um problema!!")
                    .font(.title3)
                Spacer()
                HStack {
                    Spacer()
                    Text("Update: \(lastUpdated.timeFormatted())")
                        .font(.system(size: 9))
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
    }
}

struct WeatherEntryView: View {
    @Environment(\.widgetFamily) var family

    let entry: WeatherAppEntry
    let baseColor = Color.gray.opacity(0.2)
    let darkColor = Color.black.opacity(0.8)

    var body: some View {
        if let weather = entry.dataResult.weather {
            switch family {
            case .systemMedium:
                ZStack {
                    HStack(spacing: 0) {
                        Rectangle().fill(baseColor)
                        Rectangle().fill(darkColor)
                    }
                    HStack(spacing: 0) {
                        WeatherWidgetView(weather: weather)
                        AvarageWeatherView(weather: weather).foregroundColor(.white)
                    }
                }
            case .systemLarge:
                VStack {
                    ZStack {
                        HStack(spacing: 0) {
                            Rectangle().fill(baseColor)
                            Rectangle().fill(darkColor)
                        }
                        HStack(spacing: 0) {
                            WeatherWidgetView(weather: weather)
                            WeatherWidgetView(weather: weather).foregroundColor(.white)
                        }
                    }
                    if !weather.forecastHours.isEmpty {
                        VStack {
                            HStack {
                                DailyWeatherView(forecastHour: weather.forecastHours[0])
                                DailyWeatherView(forecastHour: weather.forecastHours[0])
                                DailyWeatherView(forecastHour: weather.forecastHours[0])
                                DailyWeatherView(forecastHour: weather.forecastHours[0])
                            }
                            HStack {
                                DailyWeatherView(forecastHour: weather.forecastHours[0])
                                DailyWeatherView(forecastHour: weather.forecastHours[0])
                                DailyWeatherView(forecastHour: weather.forecastHours[0])
                                DailyWeatherView(forecastHour: weather.forecastHours[0])
                            }
                        }
                    } else {
                        EmptyView()
                    }
                }
            default:
                ZStack {
                    baseColor
                    WeatherWidgetView(weather: weather)
                }
            }
        } else {
            EmptyView()
        }
    }
}

struct WeatherWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherEntryView(entry: WeatherAppEntry(date: Date(), dataResult: WeatherResult(weather: WeatherMock.shared.forecastPartialCloudy(), errorDescription: nil)))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
