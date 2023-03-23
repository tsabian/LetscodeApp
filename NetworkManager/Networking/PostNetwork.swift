//  PostNetwork.swift
//  NetworkManager
//
//  Created by Tiago Oliveira on 09/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

final class PostNetwork: NetworkManager {
    private let path = "posts"

    @Published var data = Posts()

    init() {
        guard let url = URL(string: NetworkManagerEnvironment.serverURLString) else {
            return
        }
        let request = URLRequest(url: url.appendingPathComponent(path))
        URLSession.shared.dataTask(with: request) { responseData, _, responseError in
            if let error = responseError {
                debugPrint(error)
                return
            }
            guard let data = responseData else {
                return
            }
            do {
                let dataModel = try JSONDecoder().decode(Posts.self, from: data)
                DispatchQueue.main.async {
                    self.data = dataModel
                }
            } catch {
                debugPrint(error)
            }
        }
        .resume()
    }
}
