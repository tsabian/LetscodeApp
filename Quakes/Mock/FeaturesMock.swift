//  FeaturesMock.swift
//  Quakes
//
//  Created by Tiago Oliveira on 13/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

struct FeaturesMock: Mockable {
    static let shared = FeaturesMock()
    private init() {}
    func oneMoreMock() -> Feature {
        let quakes: QuakesModel = load(from: .main, on: "oneMore")
        return quakes.features[0]
    }
}
