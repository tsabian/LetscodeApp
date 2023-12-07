//  LetscodeWidgetBundle.swift
//  LetscodeWidgetExtension
//
//  Created by Tiago Oliveira on 23/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI
import WidgetKit

@main
struct LetscodeWidgetBundle: WidgetBundle {
    var body: some Widget {
        LetscodeWidget()
        DateTimeWidget()
    }
}
