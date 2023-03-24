//  WeatherEnvironment.swift
//  Letscode
//
//  Created by Tiago Almeida de Oliveira on 24/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

struct WeatherEnvironment {
    @EnvironmentSetable(from: "API_URL")
    @EncryptedProperty
    var apiURL: String

    @EnvironmentSetable(from: "API_KEY")
    @EncryptedProperty
    var apiKey: String
}
