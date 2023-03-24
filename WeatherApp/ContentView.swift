//
//  ContentView.swift
//  Weatherapp
//
//  Created by Tiago Almeida de Oliveira on 24/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
// https://api.lil.software/weather?latitude=-23.464515&longitude=-45.052483

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "sun.dust")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Weather App!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
