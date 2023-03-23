//  LetscodeWidgetView.swift
//  LetscodeWidgetExtension
//
//  Created by Tiago Oliveira on 23/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI
import WidgetKit

struct LetscodeWidgetView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "globe")
            Text("Hello World")
        }.tint(.blue)
    }
}

struct LetscodeWidget_Previews: PreviewProvider {
    static var previews: some View {
        LetscodeWidgetView()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
