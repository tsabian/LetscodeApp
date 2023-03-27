//  WeatherappApp.swift
//  Weatherapp
//
//  Created by Tiago Almeida de Oliveira on 24/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Atlantis
import SwiftUI

@main
struct WeatherappApp: App {
    init() {
        #if DEBUG
        Atlantis.start()
        #endif
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
