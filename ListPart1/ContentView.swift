//  ContentView.swift
//  ListPart1
//
//  Created by Tiago Oliveira on 08/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // swiftlint:disable line_length
    let countries = [Country(id: 1, name: "China", population: 1_400_000_000), Country(id: 2, name: "India", population: 1_400_000_000), Country(id: 3, name: "United States", population: 332_000_000), Country(id: 4, name: "Indonesia", population: 276_000_000), Country(id: 5, name: "Pakistan", population: 225_000_000), Country(id: 6, name: "Brazil", population: 213_000_000), Country(id: 7, name: "Nigeria", population: 211_000_000), Country(id: 8, name: "Bangladesh", population: 165_000_000), Country(id: 9, name: "Russia", population: 145_000_000), Country(id: 10, name: "Mexico", population: 130_000_000)]
    // swiftlint:enable line_length

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                List(countries, id: \.id) { currentCountry in
                    NavigationLink(destination: CountryDetails(country: currentCountry)) {
                        CountryCell(country: currentCountry)
                    }.navigationTitle("Top 10 most populous countries")
                }
            }.padding(.all, 0)
        }
    }
}

struct CountryCell: View {
    let country: Country

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(country.id) - \(country.name)")
                .font(.headline)
                .foregroundColor(.gray)
                .bold()
                .padding(.all, 0)
            Text("Pop: \(country.populationFormatted)")
                .italic()
                .font(.subheadline)
                .foregroundColor(.red)
        }
    }
}

struct CountryDetails: View {
    let country: Country

    var body: some View {
        Text("\(country.name)'s population is \(country.populationFormatted)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
