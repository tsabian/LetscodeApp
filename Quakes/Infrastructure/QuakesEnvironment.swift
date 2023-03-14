//  QuakesEnvironment.swift
//  Quakes
//
//  Created by Tiago Oliveira on 11/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

struct QuakesEnvironment {
    @EnvironmentSetable(from: "SERVER_URL")
    static var serverURLString: String

    private init() {}
}
