//  LetscodeWidget.swift
//  LetscodeWidget
//
//  Created by Tiago Oliveira on 23/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI
import WidgetKit

struct LetscodeWidget: Widget {
    let kind: String = "LetscodeWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: LetscodeWidgetProvider()) { _ in
            LetscodeWidgetView()
        }
        .supportedFamilies([.systemSmall])
    }
}
