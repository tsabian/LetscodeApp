//  FeatureCell.swift
//  Quakes
//
//  Created by Tiago Oliveira on 12/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI

struct FeatureCell: View {
    let feature: Feature

    var magnitudBackgroundColor: Color {
        switch feature.properties.mag {
        case 0..<1:
            return .blue
        case 1..<3:
            return .green
        case 3..<5:
            return .yellow
        case 5..<8:
            return .orange
        case 8..<10:
            return .red
        default:
            return .purple
        }
    }

    var body: some View {
        HStack {
            VStack {
                VStack(alignment: .leading) {
                    Text(feature.properties.mag.toDecimalFormatted())
                        .bold()
                        .foregroundColor(.white)
                        .font(.headline)
                }.frame(width: 80, height: 80)
                    .background(magnitudBackgroundColor)
            }.clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 1))
                .shadow(color: magnitudBackgroundColor, radius: 6)

            VStack(alignment: .leading) {
                Text(feature.properties.place)
                    .foregroundColor(.gray)
                    .bold()
                    .font(.subheadline)

                Text("At: \(feature.properties.time.toDateFormatted())")
                    .font(.subheadline)
                    .foregroundColor(.orange)
                    .italic()
                    .padding(.top, 2)
            }
        }
    }
}

struct FeatureCell_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCell(feature: FeaturesMock.shared.oneMoreMock())
    }
}
