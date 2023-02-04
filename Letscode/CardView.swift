//
//  CardView.swift
//  Letscode
//
//  Created by Tiago Oliveira on 08/01/23.
//

import SwiftUI

struct AvatarCircleImage: View {
    var imageName: String

    private let imageSizeK = 140.0

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
            .frame(width: imageSizeK, height: imageSizeK, alignment: .center)
            .shadow(radius: 5.0)
    }
}

struct CardView: View {
    var body: some View {
        HStack {
            AvatarCircleImage(imageName: "img-avatar")
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
