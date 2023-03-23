//  NoDoViewCell.swift
//  NoDo
//
//  Created by Tiago Oliveira on 14/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI

struct NoDoViewCell: View {
    @State var nodoItem: NoDoModel

    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Text(nodoItem.name)
                    .font(.subheadline)
                    .bold()
                Toggle("", isOn: $nodoItem.isDone)
                    .onChange(of: nodoItem) { _ in
                    }
            }
            VStack {
                Text("Added: \(nodoItem.dateAdded.abbreviated())")
                    .font(.caption2)
                    .italic()
            }
        }
        .padding(15)
        .background((nodoItem.isDone) ? .gray : .green)
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .shadow(radius: 2)
        .opacity((nodoItem.isDone) ? 0.3 : 1)
    }
}

struct NoDoViewCell_Previews: PreviewProvider {
    static var previews: some View {
        NoDoViewCell(nodoItem: NoDoModel(name: "Nothing", dateAdded: Date(timeIntervalSince1970: 1_678_797_831)))
    }
}
