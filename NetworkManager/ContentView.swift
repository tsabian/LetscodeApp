//  ContentView.swift
//  NetworkManager
//
//  Created by Tiago Oliveira on 08/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var postNetwork = PostNetwork()

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            List(postNetwork.data) { currentPost in
                Text(currentPost.title)
                    .font(.title)
                    .foregroundColor(.gray)
            }
        }
        .padding(.all, 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
