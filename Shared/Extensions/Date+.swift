//  Date+.swift
//  Letscode
//
//  Created by Tiago Oliveira on 14/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

extension Date {
    func abbreviated() -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        if let diff = formatter.string(from: self, to: Date()) {
            return "\(diff) ago"
        }
        return ""
    }
}