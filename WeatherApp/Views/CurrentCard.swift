//  CurrentCard.swift
//  Weatherapp
//
//  Created by Tiago Oliveira on 26/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI

struct CurrentCard: View {
    let location: Location
    let current: Current

    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 2) {
                VStack(alignment: .leading) {
                    Text("\(location.name)")
                        .font(.title3)
                        .bold()
                    Text("\(current.tempC.toCelcius())")
                        .font(.title)
                        .bold()
                }
                Spacer()
                VStack(alignment: .center, spacing: 2) {
                    WebImage(from: "https:\(current.condition.icon)")
                        .frame(maxWidth: 64, maxHeight: 64)
                    Text(current.condition.text)
                        .font(.system(size: 9))
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width: 100)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(8)
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .padding(.all, 20)
    }
}

struct CurrentCard_Previews: PreviewProvider {
    private static let weather = WeatherMock.shared.patchyRainPossible()

    static var previews: some View {
        CurrentCard(location: weather.location, current: weather.current)
    }
}
