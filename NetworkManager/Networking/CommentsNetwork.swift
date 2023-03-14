//  CommentsNetwork.swift
//  NetworkManager
//
//  Created by Tiago Oliveira on 08/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

final class CommentsNetwork: NetworkManager {
    private let path = "posts/%@/comments"

    @Published var data = Comments()

    init(postID id: Int) {
        guard let url = URL(string: NetworkManagerEnvironment.serverURLString) else {
            return
        }
        let request = URLRequest(url: url.appendingPathComponent(String(format: path, id)))
        URLSession.shared.dataTask(with: request) { responseData, _, responseError in
            if let error = responseError {
                debugPrint(error)
                return
            }
            guard let data = responseData else {
                return
            }
            do {
                let dataModel = try JSONDecoder().decode(Comments.self, from: data)
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
