//  LocationManager.swift
//  Letscode
//
//  Created by Tiago Oliveira on 26/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import CoreLocation
import SwiftUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate, DiagnosticsProtocol {
    private let locationManager = CLLocationManager()

    @Published var location: CLLocation?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        DispatchQueue.main.async {
            self.location = location
            debugPrint("lat: \(location.coordinate.latitude) - lon: \(location.coordinate.longitude)")
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        logDiagnostic(code: 1, userInfo: [
            "Error": error,
        ])
        debugPrint("Error getting location: \(error.localizedDescription)")
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            locationManager.startUpdatingLocation()
        } else {
            manager.requestWhenInUseAuthorization()
        }
    }
}
