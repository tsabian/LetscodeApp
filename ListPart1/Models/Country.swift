//  Country.swift
//  ListPart1
//
//  Created by Tiago Oliveira on 08/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

struct Country {
    let id: Int
    let name: String
    let population: Int
}

extension Country {
    var populationFormatted: String {
        population.formatted()
    }
}
