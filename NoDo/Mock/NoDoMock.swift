//  NoDoMock.swift
//  NoDo
//
//  Created by Tiago Oliveira on 14/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import Foundation

struct NoDoMock: Mockable {
    static let shared = NoDoMock()
    private init() {}

    func noDoList() -> NoDoListModel {
        load(from: .main, on: "NoDoListMock")
    }
}
