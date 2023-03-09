//  Environment.swift
//  NetworkManager
//
//  Created by Tiago Oliveira on 08/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

protocol EnviromentProtocol {
    static var serverURLString: String { get }
}

struct Environment: EnviromentProtocol {
    static var serverURLString: String {
        guard let urlString = Bundle.main.infoDictionary?["SERVER_URL"] as? String else {
            fatalError("SERVER_URL can't be nil")
        }
        return urlString
    }
}
