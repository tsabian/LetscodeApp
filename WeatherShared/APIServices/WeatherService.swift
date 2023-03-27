//  WeatherService.swift
//  Weatherapp
//
//  Created by Tiago Oliveira on 25/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI

// MARK: - WeatherServiceError

enum WeatherSerivceError: Error {
    case failure(Error)
    case invalidURL
}

// MARK: - WeatherServiceProtocol

protocol WeatherServiceProtocol {
    func requestData(from endpoint: WeatherService.Endpoint, _ latitude: Double, _ longitude: Double) async -> Result<WeatherModel, Error>
}

// MARK: - WeatherService

final class WeatherService: WeatherServiceProtocol, DiagnosticsProtocol {
    enum Endpoint: String {
        case current = "/current.json"
        case forecast = "/forecast.json"
    }

    static let shared = WeatherService()

    private init() {}

    func requestData(from endpoint: Endpoint, _ latitude: Double, _ longitude: Double) async -> Result<WeatherModel, Error> {
        guard var urlComponent = URLComponents(string: WeatherEnvironment.apiURL) else {
            return .failure(WeatherSerivceError.invalidURL)
        }
        urlComponent.queryItems = [URLQueryItem(name: "key", value: WeatherEnvironment.apiKey), URLQueryItem(name: "q", value: "\(latitude),\(longitude)"), URLQueryItem(name: "aqi", value: "yes")]
        if let url = urlComponent.url?.appending(path: endpoint.rawValue) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            do {
                let (weatherData, _) = try await URLSession.shared.data(for: request)
                let weather = try JSONDecoder().decode(WeatherModel.self, from: weatherData)
                return .success(weather)
            } catch {
                logDiagnostic(code: 1, userInfo: ["error": error])
                return .failure(error)
            }
        }
        return .failure(WeatherSerivceError.invalidURL)
    }
}
