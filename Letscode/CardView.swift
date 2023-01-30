//
//  CardView.swift
//  Letscode
//
//  Created by Tiago Oliveira on 08/01/23.
//

import SwiftUI

struct CardView: View {
    private let avatarImageNameK = "img-avatar"
    private let imageSizeK = 140.0
    var body: some View {
        HStack {
            Image(avatarImageNameK)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                .frame(width: imageSizeK, height: imageSizeK, alignment: .center)
            VStack {
                Text("Tiago Oliveira")
                    .font(.title)
                    .foregroundColor(.white)
                Text("iOS Engineer")
                    .font(.subheadline)
                    .foregroundColor(.white)
                HStack {
                    Image(systemName: "t.square.fill")
                        .foregroundColor(.white)
                    Text(": tsabian@hotmail.com")
                        .foregroundColor(.white)
                        .bold()
                        .font(.subheadline)
                        .italic()
                }
            }
        }.frame(width: 380, height: 200)
            .background(Color.orange)
            .cornerRadius(8)
            .shadow(color: Color.orange, radius: 3)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
