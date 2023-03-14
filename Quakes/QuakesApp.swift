//  QuakesApp.swift
//  Quakes
//
//  Created by Tiago Oliveira on 09/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

#if DEBUG
import Atlantis
#endif
import SwiftUI

@main
struct QuakesApp: App {
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
