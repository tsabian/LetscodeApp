//  WeatherEnvironment.swift
//  Letscode
//
//  Created by Tiago Almeida de Oliveira on 24/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

enum WeatherEnvironment {
    @EnvironmentSetable(from: "API_URL")
    static var apiURL: String

    @EnvironmentEncryptedSetable(from: "API_KEY")
    static var apiKey: String
}
