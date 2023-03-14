//  QuakesNetwork.swift
//  Quakes
//
//  Created by Tiago Oliveira on 09/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

enum Magnetitude: String, CaseIterable {
    case allHour = "v1.0/summary/all_month.geojson"
    case oneMore = "v1.0/summary/1.0_hour.geojson"
    case twoDotFiveMore = "v1.0/summary/2.5_hour.geojson"
    case fourDotFiveMore = "v1.0/summary/4.5_hour.geojson"
    case signigicant = "v1.0/summary/significant_hour.geojson"

    var title: String {
        switch self {
        case .oneMore: return "M1.0+ Earthquakes"
        case .twoDotFiveMore: return "M2.5+ Earthquakes"
        case .fourDotFiveMore: return "M4.5+ Earthquakes"
        case .signigicant: return "Significant Earthquakes"
        case .allHour: return "All Earthquakes"
        }
    }

    var halfTitle: String {
        switch self {
        case .oneMore: return "M1.0+"
        case .twoDotFiveMore: return "M2.5+"
        case .fourDotFiveMore: return "M4.5+"
        case .signigicant: return "Significant"
        case .allHour: return "All"
        }
    }
}

final class QuakesNetwork: NetworkManager {
    @Published var data = QuakesModel(type: "", metadata: Metadata(generated: 0, url: "", title: "", status: 0, api: "", count: 0), features: [], bbox: [])

    init(magnetud: Magnetitude = .oneMore) {
        guard let url = URL(string: QuakesEnvironment.serverURLString) else {
            return
        }
        let request = URLRequest(url: url.appendingPathComponent(magnetud.rawValue))
        URLSession.shared.dataTask(with: request) { responseData, _, responseError in
            if let error = responseError {
                debugPrint(error)
                return
            }
            guard let data = responseData else {
                return
            }
            do {
                let dataModel = try JSONDecoder().decode(QuakesModel.self, from: data)
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
