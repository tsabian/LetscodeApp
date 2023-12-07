//  ContentView.swift
//  NoDo
//
//  Created by Tiago Oliveira on 14/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var nodo = ""
    @State var noDoList: NoDoListModel = {
        let noDoList = NoDoListModel()
        return noDoList.getData()
    }()

    private let textFieldPlaceholder = "What Will You Not Do Today?"

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "plus.circle")
                    Group {
                        TextField(textFieldPlaceholder, text: $nodo)
                            .onSubmit {
                                noDoList.insert(NoDoModel(name: nodo, dateAdded: Date()), at: 0)
                                nodo = ""
                                noDoList.saveData()
                                endEditing()
                            }
                            .padding(.all, 12)
                    }
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .shadow(radius: 5)
                }
                .padding(.all, 12)

                List {
                    ForEach(noDoList, id: \.id) { noDoItem in
                        NoDoViewCell(nodoItem: noDoItem)

                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                    .onDelete(perform: delete)
                }
                .background(.clear)
            }
            .navigationTitle(Text("NoDo"))
        }
    }

    private func delete(at offsets: IndexSet) {
        guard let index = Array(offsets).first else {
            return
        }
        noDoList.remove(at: index)
        noDoList.saveData()
    }

    private func endEditing() {
        let activeScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive })
        if let keyWindowScene = activeScene as? UIWindowScene, let keyWindow = keyWindowScene.windows.first(where: { $0.isKeyWindow }) {
            keyWindow.endEditing(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
