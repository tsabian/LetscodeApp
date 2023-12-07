//  WeatherRepository.swift
//  Letscode
//
//  Created by Tiago Oliveira on 26/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

struct WeatherRepository {
    func fetchCurrent(latitude: Double, longitude: Double) async -> WeatherModel? {
        let result = await WeatherService.shared.requestData(from: .current, latitude, longitude)
        switch result {
        case .success(let weather):
            return weather

        default:
            return nil
        }
    }

    func fetchForecast(latitude: Double, longitude: Double) async -> WeatherModel? {
        let result = await WeatherService.shared.requestData(from: .forecast, latitude, longitude)
        switch result {
        case .success(let weather):
            return weather

        default:
            return nil
        }
    }
}
