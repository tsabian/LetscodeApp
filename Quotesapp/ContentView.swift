//  ContentView.swift
//  quotesapp
//
//  Created by Tiago Oliveira on 04/02/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let imageNameK = "lilly"
    private let backgroundImageK = "motivation_bg"
    private let quotes = Quotes.load(from: "quotes.json")

    var body: some View {
        VStack {
            CircleImage(imageName: imageNameK, size: CGSize(width: 160, height: 160))
                .padding(.top, 90)
                .padding(.bottom, 20)
            MainView(quotes: quotes)
            Spacer()
        }.background(Image(backgroundImageK)
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all))
    }
}

struct MainView: View {
    private let imageNameK = "lilly"

    var quotes: Quotes

    var body: some View {
        VStack {
            HStack {
                Text("\(quotes.count) Quotes Available")
                    .font(.subheadline)
                    .italic()
                    .foregroundColor(.orange)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(quotes, id: \.id) { element in
                        VStack {
                            CircleImage(imageName: imageNameK, size: CGSize(width: 100, height: 100))
                            Text(element.quote)
                            Divider()
                            Text("by - \(element.name)")
                                .italic()
                                .font(.custom("Helvetica", size: 14))
                        }
                        .frame(width: 300, height: 300)
                        .foregroundColor(.gray)
                        .padding(.all, 4)
                        .background(Color.white)
                        .cornerRadius(13)
                        .overlay(Rectangle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [.clear, .pink]), startPoint: .center, endPoint: .topLeading)
                            )
                        )
                    }
                }
            }
        }
    }
}

struct CircleImage: View {
    var imageName: String
    var size: CGSize

    var body: some View {
        Image(imageName)
            .resizable()
            .clipShape(Circle())
            .overlay(Circle()
                .stroke(.gray, lineWidth: 2))
            .shadow(radius: 10)
            .frame(width: size.width, height: size.height)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
