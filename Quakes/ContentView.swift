//  ContentView.swift
//  Quakes
//
//  Created by Tiago Oliveira on 09/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedMagnetudIndex: Magnetitude = .oneMore

    @ObservedObject private var quakesNetwork = QuakesNetwork(magnetud: .oneMore)

    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $selectedMagnetudIndex, label: Text("Select")) {
                    ForEach(Magnetitude.allCases, id: \.self) { mag in
                        Text(mag.halfTitle)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .onChange(of: selectedMagnetudIndex, perform: { newValue in
                    debugPrint(newValue)
                })

                List(quakesNetwork.data.features, id: \.properties) { currentFeature in
                    NavigationLink(destination: QuakesDetailsView(feature: currentFeature)) {
                        FeatureCell(feature: currentFeature)
                    }
                    .listRowSeparator(.hidden)
                }
                .navigationTitle("Quakes")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
