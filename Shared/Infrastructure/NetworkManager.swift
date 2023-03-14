//  NetworkManager.swift
//  NetworkManager
//
//  Created by Tiago Oliveira on 09/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

protocol NetworkManager: ObservableObject {
    associatedtype Output: Codable

    var data: Output { get set }
}
