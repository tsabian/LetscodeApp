//  QuakesDetailsView.swift
//  Quakes
//
//  Created by Tiago Oliveira on 12/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import MapKit
import SwiftUI
import UIKit

struct QuakesDetailsView: View {
    let feature: Feature

    private var place: String {
        feature.properties.place
    }

    private var magnetud: String {
        "Magnetud: \(feature.properties.mag.toDecimalFormatted())"
    }

    private var longitude: Double {
        feature.geometry.coordinates[0]
    }

    private var latitude: Double {
        feature.geometry.coordinates[1]
    }

    var body: some View {
        ZStack(alignment: .top) {
            MapView(epicenter: EpicenterEarthQuake(title: place, subTitle: magnetud, longitude: longitude, latitude: latitude))
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .center, spacing: 6) {
                Text(magnetud)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text(place)
                    .foregroundColor(.white)
            }
            .clipShape(Rectangle())
            .frame(width: nil, height: nil)
            .padding(.all, 20)
            .background(.black)
            .shadow(radius: 9)
            .cornerRadius(9)
            .opacity(0.6)
        }
    }
}

struct EpicenterEarthQuake {
    let title: String
    let subTitle: String
    let longitude: Double
    let latitude: Double
}

struct MapView: UIViewRepresentable {
    let epicenter: EpicenterEarthQuake

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinates = CLLocationCoordinate2D(latitude: epicenter.latitude, longitude: epicenter.longitude)

        let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)

        let region = MKCoordinateRegion(center: coordinates, span: span)
        uiView.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        annotation.title = epicenter.title
        annotation.subtitle = epicenter.subTitle
        uiView.addAnnotation(annotation)
    }
}

struct QuakesDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        QuakesDetailsView(feature: FeaturesMock.shared.oneMoreMock())
    }
}
