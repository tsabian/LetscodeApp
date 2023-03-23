//  NoDoModel.swift
//  NoDo-B4
//
//  Created by Tiago Oliveira on 14/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation
import SwiftUI

let noDoDefaultsKey = "nodos"

struct NoDoModel: Codable, Hashable, Identifiable {
    var id = UUID()
    let name: String
    let dateAdded: Date
    var isDone: Bool = false
}

typealias NoDoListModel = [NoDoModel]

extension NoDoListModel {
    func getData() -> NoDoListModel {
        guard let data = UserDefaults.standard.data(forKey: noDoDefaultsKey) else {
            return NoDoListModel()
        }
        if let noDoList = try? JSONDecoder().decode(NoDoListModel.self, from: data) {
            return noDoList
        }
        return NoDoListModel()
    }

    func saveData() {
        guard let data = try? JSONEncoder().encode(self) else {
            return
        }
        UserDefaults.standard.set(data, forKey: noDoDefaultsKey)
    }
}
