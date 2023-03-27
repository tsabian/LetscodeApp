//  FailureView.swift
//  Weatherapp
//
//  Created by Tiago Oliveira on 25/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI

struct FailureView: View {
    let error: String

    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 2) {
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.red)
                    .frame(width: 64)

                Text(error)
                    .font(.title)
                    .foregroundColor(.red)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity)
            }
            .padding(20)
        }
        .padding(12)
        .ignoresSafeArea(.all)
        .edgesIgnoringSafeArea(.all)
    }
}

struct FailureView_Previews: PreviewProvider {
    static var previews: some View {
        FailureView(error: "Serviço indisponível no momento")
    }
}
